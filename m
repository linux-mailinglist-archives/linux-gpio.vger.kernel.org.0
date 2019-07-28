Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3095F78230
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfG1W7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:59:01 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35986 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfG1W7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:59:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so40733373lfc.3
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7cpnNhjoonDmEkUXX/FcWxaQpdtFRkDDXf/a02wQO8U=;
        b=d7wz/kPrVXPPE0EK8nix4F1zOnDPPR6ikXZJULkZ5sS4YFG8eWhMsit58GZyzEp5dL
         1ax1QLhB7E4uAVdJOjxj+E9Ylok85UGjvaVRqo0fPGkyrnJSHADHB/H4IHM6I9K7ZaNX
         6cqvFpplywcDgxvt4kAsafJcdG68ujh55JQ3kLPOCEGWj/e6FAlrZSpzERUtDYuo1TrS
         gGqXZ+NFuISuOIiME8RXk9YOeww6fonI9TDbLVlOpjY9j8jz2ia3mCXezCUZ2qYH1iw9
         6Ms/fhiRzhH+4Y67bKctLFvAYUSDBY+XmBK7/ztMyJUxDa83imatYifeC83zdy14VjpU
         B6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cpnNhjoonDmEkUXX/FcWxaQpdtFRkDDXf/a02wQO8U=;
        b=PirrOYpnkJqmvO3GBSTKYllr7NltTM4zlregj0f3cfJ2CXMgWI79QEGyXtfNEQHZgr
         c8nErsSRzflb0R+01ZSXQVxlAM6Rf7pIR8DIb7pQS9faqAvrB/cNd1JIa388pmihZn9y
         XJ9++xCVUt/haQaRY2tmCH+BV7h5EkvOweprPYI6HtbfpeyyGbLpiPYH0GdGX+cvHuEV
         MPGzQW+hGUIXlE70VWfj/cImCb9nO48ZHX2JfF4k47pqjDxXFe2SllHuduIBWzv97c8t
         XeIC4GrhlCk6PIhTwDSrXjPiAPw759zCwc7cVHU3CoNMI1ai7DSWTJn0B1NGD0C5Wtgf
         Cy/A==
X-Gm-Message-State: APjAAAWXThjE7jcWI/gFGCejgxHdPumny3I0M4ZjOCS7TJ5yvx7+VX3M
        AacSRFMGY7tnbWIZAAQEvrQRGZf6mA/AB+QVI/T7nQ==
X-Google-Smtp-Source: APXvYqwa2xZ1U26fwVAeM34mNz4McRVa0UDLuCcDymbTVYyP9jT+fg84OSSQiuW1P3zLmlBSm9n4azMLNBNPY3SL4x4=
X-Received: by 2002:a19:e006:: with SMTP id x6mr48911419lfg.165.1564354739013;
 Sun, 28 Jul 2019 15:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190707203558.10993-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20190707203558.10993-1-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:58:47 +0200
Message-ID: <CACRpkdags1geSzrLxVGf11PvpH+c_N0F7oa=42C57geKpm2VjQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: Preserve desc->flags when setting state
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 7, 2019 at 10:36 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> desc->flags may already have values set by of_gpiochip_add() so make
> sure that this isn't undone when setting the initial direction.
>
> Fixes: 3edfb7bd76bd1cba ("gpiolib: Show correct direction from the beginning")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Patch applied for fixes and tagged for stable.

Thanks for digging into this! Excellent work!

Yours,
Linus Walleij
