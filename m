Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D520C3F1140
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 05:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbhHSDKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 23:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235806AbhHSDKL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 23:10:11 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED52C0613D9
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 20:09:33 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so6907933otu.5
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 20:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SsXVSz/26EZKyGqHQ3H98C+Z+vwznDQGFVyM/rcTClE=;
        b=oRLpRJvMBywHPqy3mP5+xHspefHDLfoPPXCmKMZGgiwYSxb4ZL7W+wPmesXjmhuXq4
         AHMRMRyApr/SLz/94iRdy7wm4mdQua7EX6AQuK2uiYcxmPERmaJBVr96U3E08hWWntYk
         lB8SKlcIKP9h+mB+Ozn/ywfXd7y+m7AIinh9qsXnJIFv2xRCxPs/vuME9ou1AdJrBJ9d
         NV2vuEaZQ+pgj3rt4MLAXaOLW0U/5ZXBMhUIbm5ZVF/PHNyuB3SToMWj1Ay5Q966V+mM
         QbIYlzPBNenCzZ550cq26p/jAQolvTHPkat/VGOigKlnGfhOVK9cjYdtBQjKg7mGJi+l
         0qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SsXVSz/26EZKyGqHQ3H98C+Z+vwznDQGFVyM/rcTClE=;
        b=BdGd9CBA6OGmSv3TmgJG/LvMAsqB65FJh+Rta/7o1CQaxXIF2otTwxW1pYQfdBswXl
         2n0A7ZC6oTb646dwdodGBtnkXtX8v0h8prsR3fDQv6cuqGABsyAT8CDFVbLnvqfUaxTW
         sejH9CbKhkXj0tjOYj4bZhCfzd8qB49alpejl4QQA8+wKQORcz/GrHcwivnvPfE+EZnm
         6w1Fq7e0OIRiaEleP9UEzTtVAALsJgoFLbPEj7XNpR0Df5W0Gl0n41ktbXE3vm4TR7mc
         AiV3TlOPqOJt/mES9M0c+4dvlu6cex2pE/sVcsGox96m8EWnAUw7kUCUw/bQUiWOidb2
         4MCg==
X-Gm-Message-State: AOAM530YAlhxyhvxexDjle8/fkjdm7D1pslZg1OHd5MjBC5ey9NzdTT8
        jawFfetvLFgJe81hfXQmPgj6OQ==
X-Google-Smtp-Source: ABdhPJzUr7YNQNUEn92uuV9i+Siah4bxj2eJM18N02R01SKX3saiB6iP+BzbrB8LhTchbMu/QBzTPg==
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr10046192otk.226.1629342572357;
        Wed, 18 Aug 2021 20:09:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j70sm449089otj.38.2021.08.18.20.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 20:09:31 -0700 (PDT)
Date:   Wed, 18 Aug 2021 22:09:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add SDX65 pincontrol driver
Message-ID: <YR3Lah3xSMnrfXSd@builder.lan>
References: <cover.1626987605.git.quic_vamslank@quicinc.com>
 <ae414345bf85359f38895b44cb53eeb82c4f8758.1626987605.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae414345bf85359f38895b44cb53eeb82c4f8758.1626987605.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 22 Jul 16:18 CDT 2021, quic_vamslank@quicinc.com wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdx65.c b/drivers/pinctrl/qcom/pinctrl-sdx65.c
[..]
> +enum sdx65_functions {
> +	msm_mux_QLINK0_WMSS,

I think this would be more aesthetically pleasing if it was lower case,
like all the other entries. Can you please fix that?


With that:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
