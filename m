Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017F33CFD31
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jul 2021 17:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238428AbhGTOdl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jul 2021 10:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238642AbhGTONO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jul 2021 10:13:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DDDC0613E6
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jul 2021 07:47:29 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c12so8285093wrt.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jul 2021 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YpVJllfKfCab4WI7vZbwkWkukWtG7iKO9OuxI4FyktA=;
        b=TJPqBC+frxSdMp/eo9MliirKKkfkUcOma1p41wl7IWl6V9qOjrv70QjbtPB1pV7Fsm
         qX4+VN5daNACbqpsx+2+6I7fnCuGfBABxxb0h8x7YFPWqgrqEpsfkaSHam2Qv/VtnxhV
         ZHwBQzOJtViZEaq1lslzs02Iqm+iKGVw1RK1g566EZRAssHRyY27i/t8FqXOBAbmLzoJ
         xqulVGmDZr8N7mbCcl27RBHY1Fud2lEgi/FyG/oekj+CwRLLfjF+NYOWShLV+sHJTFLc
         ihmOcYYf1hCJLlBC35+QYuurKTZQaCX20dtGi1ZBizV8gYYlxbIEsZKpiFRoE1Kgw+s7
         HgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YpVJllfKfCab4WI7vZbwkWkukWtG7iKO9OuxI4FyktA=;
        b=s+QpRj+NQQc0N6Tqyq08Dgn3c+qCLkTPDMYEbn6YTI45fVc0r+evHxSW3mfdcwdYYN
         aCIuBfyAdWQKRWb6bchR6vn/e82JNL+d3X3/X+uTxLqkchv4M+PCBLV9iAw7G9wPDY4c
         cUCj2c6UfUAEZGgiIwnwNp5uZeRqRy8xa8+QXPWreqvCSRGqZQkAZCdtO3ws18qeZIJI
         aSlYxrk46AZLgIsGQHWvKqA4ymPw15Y7ARMXVoXlsXP+D41dsYAZjH/HU3JXo8Ms4WZp
         v4Mu920Igz3ZYohDlxznEYNWrj6VTCmog0jvMzdHyKRTSBeMfo14s4wuqVXmY0VeLwZh
         n9Sg==
X-Gm-Message-State: AOAM5318/X4s8u/yb3kUMoiP0wpQ0woV8jICnxYXwfz1+FDG5WMFRot/
        8Gf3MsSyMD55UprSOfGJpRpRxA==
X-Google-Smtp-Source: ABdhPJxatlhjVZ0hj5htisCuKk3/2kC2NLj19NCRnCRqFJekFAcbfWPOsa10BcQXSiPbE9QiKuk8cA==
X-Received: by 2002:adf:ef11:: with SMTP id e17mr36769733wro.71.1626792447642;
        Tue, 20 Jul 2021 07:47:27 -0700 (PDT)
Received: from google.com ([31.124.24.141])
        by smtp.gmail.com with ESMTPSA id n23sm18879644wms.4.2021.07.20.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:47:27 -0700 (PDT)
Date:   Tue, 20 Jul 2021 15:47:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Chris Blake <chrisrblake93@gmail.com>
Cc:     ptyser@xes-inc.com, linux-kernel@vger.kernel.org,
        chunkeey@gmail.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] mfd: lpc_ich: Enable GPIO driver for DH89xxCC
Message-ID: <YPbh/T5n1gxBdNDe@google.com>
References: <20210607233535.4198-1-chrisrblake93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210607233535.4198-1-chrisrblake93@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 07 Jun 2021, Chris Blake wrote:

> Based on the Intel Datasheet for the DH89xxCC PCH, the GPIO driver
> is the same as ICH_v5_GPIO, minus the fact the DH89xxCC also has
> blink support. However, blink support isn't supported by the GPIO
> driver so we should use ICH_v5_GPIO. Tested and working on a Meraki
> MX100-HW.
> 
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> 
> Changelog:
> V3: Update commit message format and update contributor message.
> V2: Updated commit message, and added Christian Lamparter as a
> contributor.
> V1: Initial Patch
> 
>  drivers/mfd/lpc_ich.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
