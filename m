Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA8A42560
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 14:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438779AbfFLMSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 08:18:12 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:32881 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438778AbfFLMSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 08:18:09 -0400
Received: by mail-lf1-f65.google.com with SMTP id y17so11924005lfe.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lLgqFLgI1RD7txKsXHTcttpt8QJ2qspurJ8r4TaFBuo=;
        b=FfvLpUOfzN6wTBDG93ptVmlfJBX2N34h39prIp2th17F7l4y5WYEM1Easy5npKwdPR
         yrNaZYf2mW4ZJ++7lbZWkbYO5T/KdbeNQ8aIFYczQ2ylarmaXoYt/zdNMPONaKWImR4C
         qBuxaiOyay2r17jP/3shi+mEkf16wTWbWzu+5BH2RN/BUaaJsOljwQJPtKPbPljdFhSG
         FxbxZ8ijKX2RMJyFfxSH00IrZJF91EcroP5wgKVdynk9K09i03hnimr+LhD8uQyTaoE+
         3LWLKtl+zXMFXfnXQqS/4vSDK6OiYZDSuHafztRmKI5qpZOCks9/gdAoyUPDIn66y9VY
         7rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lLgqFLgI1RD7txKsXHTcttpt8QJ2qspurJ8r4TaFBuo=;
        b=WKIATO8C625ZdCJBMSLPmru7pBw/3pRzs0gGLr7AGOPNNt6Ae5+e/pH8ozko1YRBZs
         J2FmRrF7Umt6wPJDVXoac/zawpnYZEOfFA8vgo0xwBDow5GFuaGFudjkEcKHS6OPWGQk
         6tY1BDmcfY1/lwdHggBwOelHOVJrhnWRF8o+hAnnv/1/GEROX6Nw4tLufV+JKiRuObfi
         2ydHuo6Bm+q75pUTbQ0Fjz72UyT4YlH605x6g1LQxlc0GfEo/Hs1mYw/leoY1lObruq/
         QZTeRtXurlFOpDsRsWOLMdwXt9Nd3I10uiZpu7DnhBX4uSfUy7VDvA3EKflTU8uOiMRG
         yKlg==
X-Gm-Message-State: APjAAAVdUlfxQK2Z/FB6IPqs1KTC6a1W+ww9BmrhnWMMor+bLGne+lAT
        35jwZjYqLmpW9KYfRwTIOnBiMrho3U/hIaQ22cQJuQ==
X-Google-Smtp-Source: APXvYqzzhiF6iMG++OhR+MGtmOroCfV56gr3a2ZeGoM8umsfC45K9xFo43Z8yZlHV/8RUbSoa7Te3b3r4DhtKwjvqug=
X-Received: by 2002:a19:7616:: with SMTP id c22mr37373804lff.115.1560341887523;
 Wed, 12 Jun 2019 05:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190611072001.2978298-1-lkundrak@v3.sk>
In-Reply-To: <20190611072001.2978298-1-lkundrak@v3.sk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 14:17:56 +0200
Message-ID: <CACRpkdYeWMs30Q3zD1vQF-yC1_PKuOFDSDs5nVqhMSfrgFvu1Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: xway: Switch to SPDX header
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     John Crispin <john@phrozen.org>,
        Martin Schiller <mschiller@tdt.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 11, 2019 at 9:20 AM Lubomir Rintel <lkundrak@v3.sk> wrote:

> The original license text had a typo ("publishhed") which would be
> likely to confuse automated licensing auditing tools. Let's just switch
> to SPDX instead of fixing the wording.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Already fixed upstream by tglx pattern patches.

Yours,
Linus Walleij
