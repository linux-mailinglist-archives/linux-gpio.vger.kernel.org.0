Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCF81053FC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 15:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfKUOK0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 09:10:26 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38804 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfKUOK0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 09:10:26 -0500
Received: by mail-lj1-f193.google.com with SMTP id v8so3383083ljh.5
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 06:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJr5TKLYdPNJRAX3qEH8F1mSjnVBObJYF2mexkZ2Mb8=;
        b=M8TfQYQ2YFoW+pdD8qPKkhHHUpuWhPe6ZwEnqP3WiHjuFn5kXFqYfVgKgT00GsOvb6
         jGptIRLTk3JKSjHb1gFz0Iy2j7MOo4d/D0M1zkuLE65adLb4zq16pyw4XXBIf7C+L4Jm
         PN30Fv4Q6uhjCv3NHMS6he2yrBHX61nWbqL7SJl0Z293eX9QX36ZnyX4Fz32MhBSXUIs
         lbhJEmWVtXPqQjoWBwVuRaVY19iWxywrSzeN9qMaxT1MdqfBJ5kg3YW9PxPuBUSwQ/Pl
         Xwo4d/DziLKOCz+Z2hBE+KtxEIfPhHkXndybGj95JT9BQrnT4MA93QV+ENOjq+blTR5h
         0LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJr5TKLYdPNJRAX3qEH8F1mSjnVBObJYF2mexkZ2Mb8=;
        b=pYeJbNFfOZMLdumNdM8sQjEukpjusNO+Q3tlTSSBWAVQi8n4DWcuVnVp+55cbxVLhX
         HpPgWZBlOUxsR6cxr5vD8kbRdNcXj1mpXZLZQfjLWBDl0JHWhA+PozD5BpRghn1BBD8H
         YIJVattb0UamrwPSdOkvEgDGZYcpIEZxrXa90hFIUv6XnGUcFJdgaFlyftOntsoE3Q6X
         OrPjlIS9c+w3b0TKZluPVyWHKkoMtzB8G/uM3SVYaR0wc0AITQA/fuxK2KZl1JQ+y6JP
         3AiOJVcjziIXgLeZWyB3xlVZjVpcsHuxNREapfS03zZ+1dY/EikLgAy2LocIHr1dx8Q9
         PPHQ==
X-Gm-Message-State: APjAAAVa75TUkO0qsErpQa/D+U+JXSvftGGL+CWJf+zKpmxEXHImDHYm
        MOQn9R32PfEdPTBEZ9zNsNdKsDHgnq7zIoYDQEex8Q==
X-Google-Smtp-Source: APXvYqyTp9UobATgipJw5x8QE/Nw9xZJKmgCtO03/0B62/xoVW/SnHidSqxIs9zNdLsdbeLiKfW89R4BjjPS9qHAAs8=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr7645392lji.191.1574345424517;
 Thu, 21 Nov 2019 06:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20191119155211.102527-1-paul@crapouillou.net>
In-Reply-To: <20191119155211.102527-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 15:10:12 +0100
Message-ID: <CACRpkdY_C1LKS6a2AqwEmR5fbj3r6djzQqy4-D5RU+WNDuG4fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: Handle PIN_CONFIG_OUTPUT config
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 19, 2019 at 4:52 PM Paul Cercueil <paul@crapouillou.net> wrote:

> This makes the driver support the 'output-low' and 'output-high'
> devicetree properties in gpio-hog sub-nodes.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied!

Yours,
Linus Walleij
