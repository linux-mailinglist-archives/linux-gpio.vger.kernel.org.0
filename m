Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C7A2FD8AB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 19:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbhATSpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 13:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404470AbhATSWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2021 13:22:30 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AB6C0613C1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 10:21:50 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id w14so5974086pfi.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=3zA2PNOgC/6qMsKy4aM1hGJRHMX6FMexQumMpBDwYYg=;
        b=A2qykjDjIALvxy2rFZKrHfmDImHmjIdmVaOm1B4dktGCC6yYKvZrZ6S7nG7X9dROx9
         XFrIpnfiuGjIXk19bJ5F9H89C0OapDwiH4l3CTO2FtJI2eo3Ia/zCXgKqr8o2Vtpd1Ly
         gtNNmG6xu4x2tMeE/lHyDX929zDR/2iG7zXXMti9igv6IPU4rLBJvCxWRBB1RkgNfPEk
         EcrFtDCIeIrrs/7e1C8T8d1TZR+3eZKB02i2onasg0Zx5PtiSn3kz4tmSzUggXyi1i7y
         XNxwbYay885qrx+O7+HpHrSk7cd+e0dt3xDDRCk3C4peRJWEEGCk1KsGpbeRHkNPP1K7
         u+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=3zA2PNOgC/6qMsKy4aM1hGJRHMX6FMexQumMpBDwYYg=;
        b=Ez0UFcuwmiuz3En2qjWQt/MLAHAfdTraji7lQqBtluubyO8wogbjvg7G5srIyteV50
         l2eW5cOjxaHeRh950CBZkaMctFvfggi9pAyxevTlFUODe2ZqE7DCRb6kCEuSK8J4psuE
         cOejia8LPtuQQ1GTldtElfzByCWFXBGbn8gxcEdtukaQaecq0YMJGgPh9nSi0Sf32Iju
         ygbZrwGGOxLtYFJbaHtqkymOI1FuTRqNVCaNPzLetrz3NZ8YVEyZOWgEG9mVGkU+6vSR
         ndNp6t70xOxD2zJkWOhswaeaDII8cdBvYgW8B/7lALb7xIWGNhbamW1hGyWwHwzaEjU2
         qneA==
X-Gm-Message-State: AOAM530OJ/NlfmoMeTCUgFOkB4rcs7f7l9+fyb2VwXVR12jqIGDXFbEY
        ZtUhAJth5ayD0qYIT3CV2GuTeQ==
X-Google-Smtp-Source: ABdhPJxZ9IXq8e3w29XqwyA4tFdKUt34VgrdrBdiovLR95Y4t32vajYGB/nJA8DVEItUbXob/hqirQ==
X-Received: by 2002:a63:1142:: with SMTP id 2mr10642235pgr.263.1611166909930;
        Wed, 20 Jan 2021 10:21:49 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id x127sm2965069pfb.74.2021.01.20.10.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 10:21:49 -0800 (PST)
Date:   Wed, 20 Jan 2021 10:21:49 -0800 (PST)
X-Google-Original-Date: Wed, 20 Jan 2021 10:21:47 PST (-0800)
Subject:     Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
In-Reply-To: <CACRpkdbTazK7yLPVe79SoneD+tdiXv9GPvN29dSMgCZkf8Pjbg@mail.gmail.com>
CC:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        seanga2@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     linus.walleij@linaro.org
Message-ID: <mhng-8e7e9405-6528-4fec-8d2e-41eb7ec1362c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
> Hi Damien,
>
> this looks all right to me.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Shall I apply just this one patch to the pinctrl tree?

That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
take those as well and I'll drop them?  I don't generally like to drop stuff
from for-next, but that's probably better than having everything all mixed up.

https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805

> I think the line that touches arch/*/Kconfig should be dropped
> then, that better go to the SoC tree.

I'm OK with you taking them along with my Ack, but if you don't want to that's
fine.  Just LMK

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

> Yours,
> Linus Walleij

Thanks!
