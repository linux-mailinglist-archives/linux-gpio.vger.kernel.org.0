Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E9E6BAD3C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 11:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbjCOKNc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 06:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbjCOKNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 06:13:09 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F3D6773E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 03:12:42 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id j7so7823898ybg.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 03:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678875161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XH/53H7T51CCjkrUF96bIPfasY8QgOkTHXde1NMJKdA=;
        b=lhf+DrTjxetRHGFZVnCpV0qiOjxexo4LLfpqCZvbxAurASjRG5+BP0MtFajIIpsUX6
         z6/OzbDbGhi5UArZZFh1hoQBdcUz7BEihm+miju9TNZhdrxgGamEeBJAJxUKvKX3A6q0
         KSyIm8sGbSEPPSvWtxLBHfgknQwpd9S0DVhFSDGRQ8H8l0wUlDT0DsAlx6WIQEPVzH2C
         4xsvuvFyVTv88UQZcLWBQCimMsqimr8UZlooYqXCNu7Sdiv1l0SB94TW4fyMqxedaNzV
         T2iqTSVfZeQMAsIpfMsGk0TfA2cuZOnz1n/FDkT0sRFgePkzyU4Eh6GYDITk3erzcfxF
         yptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678875161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH/53H7T51CCjkrUF96bIPfasY8QgOkTHXde1NMJKdA=;
        b=W40Uc047gjrOtqARc0meS4g2T6F+1GyGjbetj1HjkRXQw0yfLXqjHzKP2HEDw9aqRm
         GVfSHHlrgSrpWVuJh8bLN5J52SCWNKnfjPrM11K1fgs/rfEGQ0JVATHOqnDOnvtxOgBd
         Yv9az422vpFtLM3OTgG7JN00592hpU7mda3tuFAuRdni0QXT8q542JjbwrPE+irbuvgc
         fD2yGlWlHmx3klh3RTHF+0hweI83qC2e52K3Dts8U80noTJvAP4cR2FlVdNXqzR/J0a0
         GOZsMwdo7DwqEKQg7ncdN5ptpd/XbG5qdvFQJRmXzWynHPr/beLLmogMAPiCvbnwXMOd
         amKQ==
X-Gm-Message-State: AO0yUKU/QGjja7fnq5FdiK/tfgDwWdt5JFdOyHHVV4xScFMIICC9HHzw
        RFBRrlCnpnpmGCs3pNBr8m2wCd1W1pM5eZvcijsGoA==
X-Google-Smtp-Source: AK7set8q763XlzGJtNcP66qnCpAy6/Ww6zXcpgSZ/YGUMR6JneRhun7B5Ng8ghX8IMiJ9wC8vZdk3dYYXtkUruaUfxM=
X-Received: by 2002:a25:9a45:0:b0:b26:47f3:6cb with SMTP id
 r5-20020a259a45000000b00b2647f306cbmr11765908ybo.4.1678875161347; Wed, 15 Mar
 2023 03:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230314221609.22433-1-asmaa@nvidia.com>
In-Reply-To: <20230314221609.22433-1-asmaa@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Mar 2023 11:12:28 +0100
Message-ID: <CACRpkdZPR9TVOOGUQd1n_O-wdh6pHCtfGuEWm0HyyVWPFGMFOA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Support Nvidia BlueField-3 GPIO driver and pin controller
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Asamaa,

thanks for your patches!

Once you have addressed the final review comments from Andy,
do these drivers have compile time depenencies so we need to merge
them both at the same time or can the two patches be applied
individually to GPIO and pin control?

BTW: big thanks to Andy for the big investment in reviewing this
driver!

Yours,
Linus Walleij
