Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C8D4FBF76
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 16:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbiDKOsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 10:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiDKOsa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 10:48:30 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49701DA44
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 07:46:15 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h11so20439532ljb.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emlid.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EF/ZdlrN8nRjyRvKSDd/5K9MT4ZIu7zI75wMmScg1Y0=;
        b=T8WpesY6zJeO/FV/hQmh529qIx7VZ75UXCbXttt7Loov9CfiOMbuuJsGwR4t2haZcT
         GmbzJLGb2Fc8uzoX0R+4Rb30ccUoEDKzSgvfeba6nqJ2EGJrOP7ANOIkbtUrnO9vQfMP
         2fgYl301nhSQHnJC8qVpgnHxiFXwPFfz+rJwvSFZ/iYw/qMtkbcOQ1vZK6OALQnZV9WG
         CxnKyd8+IU5HQYPq5mZ51mvVywrachn5UmZaDbQomXyV1pKsyIXe7P1CbefKGLzNXyT1
         C6F8ct/cF20RrD5hFvqo3lHq7SN0twbXIDDFni2puc3fLBtbwRaRNAaInLhA3v6wk5MU
         VhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EF/ZdlrN8nRjyRvKSDd/5K9MT4ZIu7zI75wMmScg1Y0=;
        b=1RzvH/kRj3eHyHD7I279osDkPu6DMQgSs6Mz2qcd8vb3j7GyqlFMV2T7u721PgFQC4
         A4zTnOAXJVSzANOubZ4lxG0EkOHaM7rWXQYNPSsD9C43rsOc7Ih3vI+chP8RnG0sPf2N
         jRVDonaHlaWVrGPg478kjk1OeHiz+Ii1DNadPR2ePUB6CP8uXsSWjnlbLIVsPMidhmAz
         p/R7TYyEP9KCWWoMj+WholkFhkMFWEbxiSmbcrLFPdjplzsu4fGwAzln0ckpkv7dF64d
         7qUPDFuwAy1t6QsJ/1adHCbxQFmOw75FBYtcugye/RdmIzTLb9I29KAsak4UBeC4OfTE
         aIPg==
X-Gm-Message-State: AOAM530xhbfhkjriGULh+VfueUuMXRjq7nzIbvf+wBFCd1Dvv0nZI103
        ycdWElqUUwAPiTt77clW0nQnmw==
X-Google-Smtp-Source: ABdhPJyuNwa/ObzUgwXe219oZ5XexGEgWGjXpXNZGo57n0ucbwn1btXWx8xbgGbGNl9bszAuG4ucIQ==
X-Received: by 2002:a2e:9041:0:b0:24a:ce83:dcb4 with SMTP id n1-20020a2e9041000000b0024ace83dcb4mr20924324ljg.291.1649688373829;
        Mon, 11 Apr 2022 07:46:13 -0700 (PDT)
Received: from emlid-ThinkPad-E480.localdomain ([85.143.205.202])
        by smtp.gmail.com with ESMTPSA id q28-20020a2e751c000000b002498394f232sm3119211ljc.72.2022.04.11.07.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 07:46:13 -0700 (PDT)
From:   Andrei Lalaev <andrei.lalaev@emlid.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrei Lalaev <andrei.lalaev@emlid.com>
Subject: Re: [PATCH] gpiolib: of: fix bounds check for valid mask
Date:   Mon, 11 Apr 2022 17:46:03 +0300
Message-Id: <20220411144602.127262-1-andrei.lalaev@emlid.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHp75VfyxspOScEt1qffshdrDYuQp50O5HFbr2cUV7MYsg=JdQ@mail.gmail.com>
References: <CAHp75VfyxspOScEt1qffshdrDYuQp50O5HFbr2cUV7MYsg=JdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the grammar comments.

> Should it have a Fixes tag?

Sure, thanks, I will resend with a Fixes tag and without grammar errors.

> What does documentation tell about it?

Documentation (devicetree/bindings/gpio/gpio.txt line 152) tells that
"This property indicates the start and size of the GPIOs that can't be used."
And the example (line 178) at the same file shows that the second element of
a tuple is the count: "gpio-reserved-ranges = <0 4>, <12 2>;"

> Does it need to be fixed?

I think so, because the current implementation doesn't reserve some GPIO ranges.
For example, we have 20 GPIOs and we want to reserve GPIOs from 14 to 19.
In this case the "reserved-ranges" looks like "<14 6>" but the
"of_gpiochip_init_valid_mask" drops the range and this is not expected behavior.
