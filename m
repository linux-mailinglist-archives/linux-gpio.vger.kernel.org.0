Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F606187CB
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 11:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfEIJdb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 05:33:31 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54195 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbfEIJdb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 05:33:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id 198so2327669wme.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SyRgRxtjdMJpbsjK9vjm2B3TwSm8QJJ2pjmdSOpbmps=;
        b=AauaUrfm2cnOW6SNDfuMRv0+hlgU2BgvMMo5qTYqMWmgv0tM2Y605oJ9MDb6GCKkyr
         xxLZDhgFvVAUlAqzhZZgGwA2pJ050Cg3c+g34asToSOFZ08TE2qbNZLS3DeuykRS59oz
         8+wg3JumczxfcDO7Pl6qu7oRNbTm/41lIdyzvY1NkLggKzIkIhVByv0CcEtkutzoETEX
         NxstvI4XTnL3mAERfoDswn2CPdQJx+hVe0gJm0AM6FQHrltYCRVbW5fJLJS4w4cxHgzg
         ACVVbtk5SuzhgRFF6Z67DPh3S/iQNyWj0leAwGWeu9gnUt6RivRWexcjB7HEr88L+o0d
         BWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SyRgRxtjdMJpbsjK9vjm2B3TwSm8QJJ2pjmdSOpbmps=;
        b=tnyQygfIZaGjrEYFJliQMQoUShMeEagdsrw3y/BAja/ZRWEPGru20h2/85majQhaSy
         Qlq6zcwLLLgMtmLLoUFtp9sykv8rfx31LLvWzb0zzyOxySqvbIS/S05b19yPXsNdGBkI
         NiK32kdaG7QbS3TMmxNgqSTVhEMZOBkgOym2ktXXAJeRQN9tUipYpgWSETshtaTcRinR
         gNEuUZDSpUON0Y5sOzbIIM8S6551hnTa+RF1Pt3U/TgbHPJp3xx+CTSXosEyzmV7NOpv
         T4lnmat4TcH+9a6jPX9dtzhp5+6XOjqebhYEdiTLq1vIxOO1yW0SReTlIBJBMwA00jmn
         C1tA==
X-Gm-Message-State: APjAAAXvEBvcL15v6L4TYw1mZPq3u8f2TFXK4in+IiPdC0hn4jtvgsgB
        WrpEwDVOTgl97iDzaN7EOlT/mw==
X-Google-Smtp-Source: APXvYqzWxiSGBE8sUUva3+DpZ/awGVFeFFPJtZu5iHJoO63RJCNa28okuodpAuszCvvYsv8zSHsUTA==
X-Received: by 2002:a1c:f111:: with SMTP id p17mr1919584wmh.62.1557394409462;
        Thu, 09 May 2019 02:33:29 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id j131sm4430911wmb.9.2019.05.09.02.33.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 02:33:28 -0700 (PDT)
Date:   Thu, 9 May 2019 10:33:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6 1/9] dt-bindings: mfd: Add ST Multi-Function eXpander
 (STMFX) core bindings
Message-ID: <20190509093326.GV31645@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <1557392336-28239-2-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1557392336-28239-2-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 09 May 2019, Amelie Delaunay wrote:

> This patch adds documentation of device tree bindings for the
> STMicroelectronics Multi-Function eXpander (STMFX) MFD core.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/stmfx.txt | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
