Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F004CDBA7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 07:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfJGFzB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 01:55:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40207 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfJGFzB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 01:55:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id d26so7509094pgl.7
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2019 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AMAmAlrNCQF5IxdYH7hkzTWtozT3BR6ErFNtzxt8UV8=;
        b=atmP4DL6UEhJUvwisWl6+SpMtN6TqCYWtzZsbtaCVn3HWzE16d4sNPaa2VkXjUbtdL
         yEDIy3vPiLTaFs+bDL35wQvnTaj4vQ1z60X2458lCSbrE63qSuqTUeJVqrdYbr/nXso6
         EmtHm/iDAV5UUkOuGo1OPecuddClu+bnyclRTtO3psxV2cHEOk571cIaAyxP5teWM4ZV
         KYkTVuD9nuItAGV/ze4IGu5RSIv1673yPekuU2dgcEM3wV/EH962bVASQxlsIolkC+UL
         9qLiVgZZW8nDpTc+Sl+iqmrx4ZIItT4/7iAF0j8RXUchIjffN5Dp+9dZLnWCgRqAAT+g
         xd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AMAmAlrNCQF5IxdYH7hkzTWtozT3BR6ErFNtzxt8UV8=;
        b=FSOax06CR+dLplj9508q+NplS1tUNXTk66R43j4rWdqnETvDsRk7P3tixP4rTP9kFR
         EgKUI4rKt3LtTn19W1mt2ziZgcuGF8KCDY2WrmcKZdQ9erYSQwqz0jKUbg8gXlvH445X
         //1bFBcIoJHegDhmNTWHk2nkLtsyGL0CqdS1FIJEq9WgCwnYxJ/f5TpvbEu8ioFzsSQR
         Fzv3P716DDQplaeCj3EAOmHwc1pkgOEqE40kNP3YJUlYjBqTAMW898F5wGP8KirtW43G
         f8jXYErIl/h6WA/dDjjCLb3svAZlXfbVpwj8heDqBHThnCOXUiryFbZW4y157vi1zCge
         em9g==
X-Gm-Message-State: APjAAAX1EDsTCqLA87DKaKdPlqtom3l+yAFZIPbLPbCWyQ8w7g+2DaYw
        CYTsbDl2vt827OkCpCPKWrbRGg==
X-Google-Smtp-Source: APXvYqwwgQLy9Cnv1L8T/tIaqjwJGpG+9+OtNM6k7M9JMxSmGHbFYPf8MqhOhu96LPo/fBhUY0+LMA==
X-Received: by 2002:a63:61c6:: with SMTP id v189mr21581965pgb.36.1570427700528;
        Sun, 06 Oct 2019 22:55:00 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d22sm16231326pfq.168.2019.10.06.22.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 22:54:59 -0700 (PDT)
Date:   Sun, 6 Oct 2019 22:54:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        marijns95@gmail.com
Subject: Re: [PATCH 1/2] pinctrl: qcom: Add a pinctrl driver for MSM8976 and
 8956
Message-ID: <20191007055457.GJ6390@tuxbook-pro>
References: <20191005105936.31216-1-kholk11@gmail.com>
 <20191005105936.31216-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005105936.31216-2-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 05 Oct 03:59 PDT 2019, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add the pinctrl driver to support pin configuration with the
> pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
