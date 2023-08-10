Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63DC777334
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjHJInh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjHJIng (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:43:36 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2067310DC
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:43:36 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d63c0a6568fso394486276.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691657015; x=1692261815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo0PcgB3A2dyp8uaa/OiN02AYCwOIcOCxhdnzf62NTk=;
        b=thLg8sFONkoqHnRwYFGcDbqUtAddfBHoSTmQR7U7vxghg/m+665yJrF+rq2SZedKtu
         hhAU03iQaCnoCsa8cchSEWEd1sRIP+JOqQbbsNWmN+TSiCCGSKIS1IsVmoCWrcI8JmJy
         XisRND3g7L7VDqYT8LId37nSS5p8HKfKTuQQof37twuidXBe0DIv36mCGWmGVWC+7T7b
         QMcipuqESeXolSUY4a7YDO44Lp37jolggZLFvyrfOWoOhttfpQ6a04AXKMhzPIbtUO3d
         oSPzbS/apQ6FXEoeMK9VTiU8y6t0z3QKUU2czd5nfUFWCau8xnH1tARox1574rVOMwNX
         y94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691657015; x=1692261815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo0PcgB3A2dyp8uaa/OiN02AYCwOIcOCxhdnzf62NTk=;
        b=TdT3j84ZSbZ9yvFZaMoQdoawkGMMz7TJYoMoTsUzm3cBsfdQl7P7BVdsfQ6blREEUQ
         JjalxcfRBrjLqfGWl7XBK6ZfDqB9ON4+yvFzbu37szE7B4P0y8v4mnRtwVo4UHVGwKYr
         hD9vj8jy7dP7GTRGH55q2XYddYk0r71JBkkI8Yh5v909V9Kus7uDAztDp0f0h2epG/lc
         ZIInAUadGmcYi0LHJqhyfstjEZtIv4BjMJPqpU/Cv7S3P3ghW3B3XZ9AUvjKJg+8bH1l
         2ErsV/Y1Fhao2D45Zdp74uAb9wKoAN09DDs4azDmY5qyOgi4lgXMzv1prjZ+ud+uQ9zJ
         VcpA==
X-Gm-Message-State: AOJu0YwTOfuTA5YA4Qn/Ou9k9dTii7IgfpK7DW//26zdPep0JAww0Jak
        XgrxWnE4/S3uFdN6eNa+Z4poVXlHXHD0zNSSRVFgig==
X-Google-Smtp-Source: AGHT+IGtINW+IucBK05Mjaba0xhQWQh4q+4khMRK5Nt1t1DhGxvAr7oCPj9lgHqBZ7VmKuju8BGTHA7pn7T9CaerLJM=
X-Received: by 2002:a25:d0e:0:b0:d12:77c7:b362 with SMTP id
 14-20020a250d0e000000b00d1277c7b362mr2173905ybn.26.1691657015366; Thu, 10 Aug
 2023 01:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691518313.git.oleksii_moisieiev@epam.com> <a6cefa60500cd46313ad6cda4f13f4985c0f5237.1691518314.git.oleksii_moisieiev@epam.com>
In-Reply-To: <a6cefa60500cd46313ad6cda4f13f4985c0f5237.1691518314.git.oleksii_moisieiev@epam.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:43:24 +0200
Message-ID: <CACRpkdZw8PGF7yBiQ8XQhtnXb3b+X00r1WbduU5_2h7KX5k+Xg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: Implementation of the generic
 scmi-pinctrl driver
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc:     "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Lina Iyer <lina.iyer@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 8, 2023 at 8:25=E2=80=AFPM Oleksii Moisieiev
<Oleksii_Moisieiev@epam.com> wrote:

> scmi-pinctrl driver implements pinctrl driver interface and using
> SCMI protocol to redirect messages from pinctrl subsystem SDK to
> SCMI platform firmware, which does the changes in HW.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> Changes v3 -> v4

I'm certainly happy with this version.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
