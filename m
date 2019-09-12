Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7305B0B1A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbfILJSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:18:48 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46668 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730509AbfILJSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:18:47 -0400
Received: by mail-lf1-f67.google.com with SMTP id t8so18697690lfc.13
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+78ps/YcRgQREC8bdm59/QXTeZLeIK2n4ix1Zc6YuE=;
        b=ltewyL2WgM1Du8dsV1BulMpBXfyc5iBPw/OicmEDuWpykUKquvS58FZyFlFBoWGtYE
         DKivTxiSwd/VoeS716Qu+MOJ/knvInl1KdWOq2lle4uy/NNshh9dxaOSW0ho5cGc/YIS
         9H3XI58bOMEFypzNTyT3bsNgLV9SmSW9bSRXPPFNUteYYdEH4vptUz9AKEiBCLeiY/j8
         odpcJif9v89xjj7AQ8suKy+VPNdET4YNK6pP7LrzIIvnY88gZGF+YyXjETcPUHcDjk7r
         YEoIXw2SKp+KmhwxnbZtXq6Md2o8+wF3kOx6YoT9qF7GqajMiozNqKiwjeZyFLh5ko7z
         V/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+78ps/YcRgQREC8bdm59/QXTeZLeIK2n4ix1Zc6YuE=;
        b=m5eepsSGqg5Q4DRBll7E8UFXUKT7RTBqp4oc/y7RIM5uyHaSK/AriCJtvV4ykOyIwi
         ex1ZO2SYQfpL1toPWZOUluHEHrzLNU5T4mDAwci8BDT4lbc4rpuYYlEK4oPCbZm3FhEM
         jEPHIBoUFx6KXNgyLXpnxYrUmTdGTf+qh/azgVRg2ubl0Hy9JIwlhMViwU+C0EgnwKUe
         n2zojHKX/KoX/BUlewt1bWiFHKWXgDw3k9eMndn+lzo/xAWID73aqBIxW9ThelpIC/zf
         FNChhXKgzM5lX3Q/9kNmTDp++jw7Om2BIvHEAlX+nNsDjzN5EAE41OllEt2pBm77Uuu0
         Kj7w==
X-Gm-Message-State: APjAAAVW/t6J9f1wuB6rUImHS/34vT2UN9qEcZwttqxV3dFfeHIE3+S8
        /GAhLQf/MTOON/vQiCs3PzsNCTXQDnJgu6dYa74Q1MgEM6HaBg==
X-Google-Smtp-Source: APXvYqw99POSQQmybjyQTzX+pmWjYXGnqHl/f+z6QV0Owgv09UDDxoCLWxb8BQV1wLRbkNBmLMTRSaxBTJicMRvjXTw=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr27498145lfp.61.1568279925827;
 Thu, 12 Sep 2019 02:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:18:34 +0100
Message-ID: <CACRpkdYGCWc007s-9_jvX2aKuZv8fTfV2UX-qBBi7WtePABMVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: syscon: Add support for a custom get operation
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> Some drivers might need a custom get operation to match custom
> behavior implemented in the set operation.
>
> Add plumbing for supporting that.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Looks OK but as noted in the other patch: we are accumulating stuff
in this driver, possibly this syscon part should just be a library
used by individual drivers that can be switched on/off with Kconfig.

Yours,
Linus Walleij
