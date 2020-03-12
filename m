Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D57C183302
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgCLOaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:30:13 -0400
Received: from mail-qv1-f67.google.com ([209.85.219.67]:33038 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgCLOaN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:30:13 -0400
Received: by mail-qv1-f67.google.com with SMTP id cz10so2698734qvb.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vM6oc6fo5COIOjScDqQkExf4k5Kw0lPjKerDiWDWlLs=;
        b=GDBssRqB5HoCEcSFAl4veBaM3ULCEz87+H9W6shCKz64VI7iHbHXaLRH86hKhzvEAO
         58U9az8YW2VX9xEZYQp7XKEFT9IWX9XPPupTTDtiE7hEclU/O4UdhKpffh9pTWyoBReN
         FYibIJc5xTWXHNfpH66CYQZ2J55UiZBNv5thKuW4lkbwQlIneziO+dxsXT6vqTqk+OtT
         fljVAqZVwnVn1yQkaiyFqVE1+anbH9REtujwJh20Z8o56OsxetVSycWbuDPL9eIBaomZ
         7B8PERVfeQ2ipNQnx0y5xoWFpJjQyEdkBLdMiUtEspgf/nUw1WJzgCA//C8J6rRlQJLJ
         WjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vM6oc6fo5COIOjScDqQkExf4k5Kw0lPjKerDiWDWlLs=;
        b=krN0SUwtpCh2h+D5krmD46kqElV/thQUG4oRsfusWWCSyw2W2yhGTocsy8qHnYiVIH
         ECqJEyIPpsuWADcFLN1cGJyy9fFzCuWFOcmA8jO2u/wxsP9sY1BQOyjgR/a3mqJvKoGI
         cpRb40ZMacu7p+I1UsP9SZ/WIP5vKECYK8JOMK6DtA+ajmaK6iaVCziCCgt/ezWNf115
         QpmS9Ehyhl8Iz6F/gX3buErj6/E/Xak6n/fOAyK2J54s0c4vBU3netvSQt45xVg90WwX
         gqRTBlpSOFHZa7BrqEPFasUYZn1ImZ6+AJRpRJRYDSRdXRGerYs0AUviueQc+JmVmpjH
         IUrQ==
X-Gm-Message-State: ANhLgQ3kVCKkV34NkVDW8CrchqVbUh5ZWmsbe/uVSaEZKQ6WptBwQcPQ
        C0Sneuw4q2myIYDNq1JNQ0U97VnnYQA461LoFYy2Fw==
X-Google-Smtp-Source: ADFU+vskodzAfAY2XYiDJ7aqoyeN9fXBPZhIj/VC7r42Db/fA6y3KJYApo5/zk+3zEyUUZ20T56TyvRlxLq9E51aDII=
X-Received: by 2002:ad4:4a6c:: with SMTP id cn12mr5105765qvb.148.1584023412109;
 Thu, 12 Mar 2020 07:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200312094008.1833929-1-gabravier@gmail.com> <CAMpxmJUUth5w8tvZp8mFV-FDz0YivmRWAqsOQSTdze1xagMX8A@mail.gmail.com>
 <38cbabe3-151b-1fd6-9d36-f27e9c9aa414@gmail.com>
In-Reply-To: <38cbabe3-151b-1fd6-9d36-f27e9c9aa414@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Mar 2020 15:29:57 +0100
Message-ID: <CAMpxmJVSPA9CQBGULyk69KaP42oMdKGg883z0FeFC_mSA5w2xA@mail.gmail.com>
Subject: Re: [PATCH] gpio-hammer: Avoid potential overflow in main
To:     Gabriel Ravier <gabravier@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 mar 2020 o 15:21 Gabriel Ravier <gabravier@gmail.com> napisa=C5=82=
(a):
>
> Ah, that was accidental. I was applying scripts/Lindent to my code and
> ended up also having it applied to part of the old code. Didn't think it
> would hurt, but I guess it makes sense to be this stringent on
> separating logical changes. Will send a (complete) corrected patch
> in-reply-to this message.
>

Please don't send patches in response to other threads. Always start a
new thread and increment the version in [PATCH vX] tag.

Bart
