Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E1E51B192
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 00:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237555AbiEDWG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 18:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiEDWG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 18:06:58 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7270E50E0A
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 15:03:21 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2f16645872fso30733267b3.4
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Op8es569RzvtJx0t1HAgKK6+F0dCry24CEKKr27rhw=;
        b=YpEazHzrG3OrKDD792Y+Ce65dO3svHKo+t8eTblPJlkPv7mx0Hi6FUn/maUA01DsDT
         YN6wImNIZVkB3x2NFutEPQRWBGR3V7q8eYzLmhBNMXyGRhYlWurl8gLON4jWX/jlIfSk
         x7R13SPo5LgJBnM0PSJ3HyutFTeKbDvWCR7AroFzNQ3UOSAEDY7zT+r8sbHza0VcKWPZ
         eLqTnbbyjFb6HoFzZ6fvD7nkSsIWAUFE/RSInIvkQ8pPXcgkSP1c/CGqbsdYDf4DWcWd
         POFgXJPHlxF/3hIroXtOd4LkCDhM+j1HSL3kZ0TbXXXzH41BWgvsECFDu3hjQojX95Sx
         nvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Op8es569RzvtJx0t1HAgKK6+F0dCry24CEKKr27rhw=;
        b=VUU7BhD6XUYMX1U++eOglwmufzfWkpc8K4Qm+frwL0Z0L+vaqBV6vqnifnGkkxsOHv
         y+ow7HBtj2Epm3WK9GeYJO5bSfug6pmxdNSRfJW4EBiYMhpUeJqG/Zlg/8ELtihxbARt
         ufCV0XoSwyaIJzFwOd07PwBvP0QYVrGDfJbn2diXS75fmVvOFnvgUooOL41O4kND+00b
         HLKSgiUKMiRNIvKeJTt28acWq8u9bUyQwBVzhBYgLSZpLP+GUBK1Fu40wWY0QY/j2CKs
         LdOgHhn2IynQUMIpZT+4sjzQXPTzKT83znKKCUiE2FkC5a49QyEGBvsgprsNztSYT+AP
         /3ag==
X-Gm-Message-State: AOAM5330CmThMau876+0iJUUeL1MB83Nt/WuwyxNLTefLC9O3pN4/BY6
        +MtCWWpsGlIRA/YFI7ZV/wCMnCYq9Nh3XxB5FOZzVg==
X-Google-Smtp-Source: ABdhPJyvbi6MVvka8oPb7oENkUao5IYEFHPUP3rcp9F5m8eqX5HuAA2xZymNtvXrq1hctCuXd2fwUyA6KBl6ff48FYs=
X-Received: by 2002:a0d:e612:0:b0:2fb:103f:4067 with SMTP id
 p18-20020a0de612000000b002fb103f4067mr4331120ywe.151.1651701800743; Wed, 04
 May 2022 15:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220502152524.283374-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20220502152524.283374-1-fabien.dessenne@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 00:03:09 +0200
Message-ID: <CACRpkdY7kQ0Fg_9C2kpQug0P=qHrfCu6eu04CugU-e5dO+P4WQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: improve debugfs information of
 pinconf-pins entry
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, May 2, 2022 at 5:25 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Print the name of the selected alternate function in addition to its
> number. Ex:
>    "pin 135 (PI7): alternate 10 (SAI2_FS_A) - ..."
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Patch applied.

Yours,
Linus Walleij
