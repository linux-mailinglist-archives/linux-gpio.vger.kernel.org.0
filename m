Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0782DC2CB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 16:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgLPPLX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 10:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgLPPLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 10:11:22 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EB0C061794
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 07:10:42 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id g185so2774330wmf.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 07:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bPtn9isLNQ18WMP3GY6tNiw1wLTMU9HIp4lj9/0XdBc=;
        b=Qs9doho6qfAnhMfkgpkpyC/i3Su/jhlMKa8S1fsNw/U+mx4f4qmYn6jVuNIjNAtUAe
         7sPcQzoZMDpAIUPadXosdFnIKbF+NE72/yMcm1D6htXcAfI1PQgQqv6m6+V+CZpIxxUp
         GoB5BnwmQxkHsc0syNMJ4tslax0V3+qU3opQvPtJdHiir6iBVoyimzLGGWXtssSPAmPd
         QRcgVxyAD4PA3FTg7N2/FgamGrHyq189qBDthkZHeKoCFWL3pNqLmDrsBAZlw1umSDaL
         y4oiVjQ7cUHYPZU4oBb8xqCfHrO6zS4RqkV53TlY1AxUGFGTsHiU0Xr5l+6pqcy8/PGF
         S3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bPtn9isLNQ18WMP3GY6tNiw1wLTMU9HIp4lj9/0XdBc=;
        b=fknGzc1GUbkYcr9fHbBRjqAOY99G/QBYNIP9h8XrKuSEGcuqrNetoRXGu4PXdaQ8Uz
         s3iVUAM1lNu3jYmrvd2vPb8jj/gYNTpo1tEllfZ3mJrA11p7g4aFwSitILLUW0vEvVCJ
         hcACsyX2OW5tnYaYCJzHOvIwda6xfYDlI3W3dJxRsOk76AumfRnGbQFmrTuCoPVYp9vZ
         WrQ4xdb6loLfL7Z2JtqnBmhOBa68xbtQYBJaAxeXNLcB2bFJ9zKrQIYYCg6my8MEYaqE
         woRLlmvemqWf6ofXM7ATAe0PL9ybBoB411Wgfp6n23jFP3L040rsrwUJTMu4E2MuD4e3
         wtNg==
X-Gm-Message-State: AOAM531OhXPCZcobpPKVHXsX2at2/B3+uh0dPnv0HQ3BX8w4WNNE+dr0
        rw0M0LoOPTBwuP6axR+F1pbMUw==
X-Google-Smtp-Source: ABdhPJyZNpBLHi12oDs53Wr2RBu3hzXhPAaVWQaUN/fbT/ncOUM9oj55m3nHH45rKz25X85vx/7XyA==
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr3824241wma.18.1608131441062;
        Wed, 16 Dec 2020 07:10:41 -0800 (PST)
Received: from dell ([91.110.221.200])
        by smtp.gmail.com with ESMTPSA id l20sm3980796wrh.82.2020.12.16.07.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 07:10:40 -0800 (PST)
Date:   Wed, 16 Dec 2020 15:10:38 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/12] mfd: bd9571mwv: Use the SPDX license identifier
Message-ID: <20201216151038.GK207743@dell>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608104275-13174-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Dec 2020, Yoshihiro Shimoda wrote:

> Use the SPDX license identifier instead of a local description.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/mfd/bd9571mwv.c       | 10 +---------
>  include/linux/mfd/bd9571mwv.h | 10 +---------
>  2 files changed, 2 insertions(+), 18 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
