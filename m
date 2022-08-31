Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A165A7F0E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 15:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiHaNjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 09:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiHaNjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 09:39:42 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D10A7AB4
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:39:41 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id lx1so28390349ejb.12
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=rOGk5hX84CURUj49iLqSy+bmWa6WKlqmHe61J/dW794=;
        b=TMHv6HxdfbAk6yLITvArW5txbBPBrVJo795B2GZ7fOpZpMx5Fhr9Q5fEZ7zsGZOF08
         UjAF7oyM350tPvHakj1oBWoaEXL1Ml5midEusN9rQ8OiR2TpeV2z209KHkHcHpcDvuYy
         /SNVG/5tuSb8/7uvagudeSbCkeoYpT4CvUyDmwV4ixZs8Jlt+hPAyRDLwZ66btdD6ycc
         //22vUMawkbANkYZ5lwkoFn0k7rkn528JhbKLHvx50eSMnyc8PRKTwY3MhbCWl2TPGUO
         x/XNz3pPfSn4wglj/9p3OXyNxqKkadWMx0q2oVo/cSnD5r4csZSitPQV+UA7EPCijv9x
         c+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=rOGk5hX84CURUj49iLqSy+bmWa6WKlqmHe61J/dW794=;
        b=3HgsujVLL6h/Ju1dp98H+pAjfNRRmn/IsxjwvN8LJQ5cF7WEx1G25y9EJwpK1KIRut
         L4aV/eKGVNMvaLBjzRG05zq61NwXReC1AojQ47a/+a3nyTgotPb2sGFkg4HbIb0V6v+s
         ivrtSWN406cD8G8ZcddHaKYt95knKrT+JC6SI8VoUYZwxUGaARRF1cKmcPIW1JVsruLT
         16iUAtC54rDgooE9Fwy9YBKEUqSPpDqS2Vl883vYFzY55L6I2dKh5+TExJwR0B865UYw
         IX3z02Nx5kFSjnd6KLcdM8IraWIyE+GfgLAuG/nAz0t/GWKN4c0r6UoLKuZjtnEhucjg
         iJlQ==
X-Gm-Message-State: ACgBeo0iqbtob8gta2C/AdXE3stZkzdFxECSJOCWDP8nVosZKPPUZtgK
        JedjNEq+jlzVTzg3l1HtKemb66naIW8VsO9GMqZu1MQoEdM=
X-Google-Smtp-Source: AA6agR7Rs2yWvJ4dkirQ2iu8CXvCl+EjQ9u8HJtGrU8+nyPlXQFXHrd/mbJYzcM3z9U1V8yAWn5k2hFiaGvyqRcRi9Q=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr14463012ejc.208.1661953180187; Wed, 31
 Aug 2022 06:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220830110525.1933198-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220830110525.1933198-1-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 15:39:28 +0200
Message-ID: <CACRpkdb8B+XP=_Fip4nwug2bfmJE_3AdEy6dnN5RdseQ5ED3OQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: change dev_warn to dev_dbg for additional
 feature support
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     linux-gpio@vger.kernel.org, Shyam-sundar.S-k@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 30, 2022 at 1:05 PM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Use dev_dbg instead of dev_warn for additional support of pinmux
> feature.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Patch applied.

Yours,
Linus Walleij
