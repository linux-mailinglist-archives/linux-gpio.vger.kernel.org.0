Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0591648C88B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 17:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349968AbiALQfZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 11:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349944AbiALQfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jan 2022 11:35:22 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB6BC06173F
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 08:35:21 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id ie23-20020a17090b401700b001b38a5318easo5821809pjb.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 08:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C2ATetSQeCBjwBw69F25qh0n06pkEvEtYk9VzNxKLpc=;
        b=LbYHzRltxYA4tlro9NkFQjGzP039x21ljVgaJvNIqKphNgZdSW6UdB8cMcpvbBn28W
         mVC8QnQ5h6Tu1sC2swvQT2ArqMCbZlyAq6ZK76jV+7/IxTwH1wsUh240lozdmfr4IQaT
         kGSkcETwDoPdxf8skp4n24X6vYcT2itdBZLDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C2ATetSQeCBjwBw69F25qh0n06pkEvEtYk9VzNxKLpc=;
        b=Ky7PrxhuHRTLjusvQnrDSziACPbSlV82CpFw5kZTS8N2JAs1Tbjf58YfFCSEufVPCU
         12oFcugKdhm5i2XFYWFi0GWXwzj2THs6swPF0C5dH1IRDkmIrx+PEdaiP0SCqiYg1qGE
         gXYo0xBQ9UuuUotZZXrFggfqPklX7B6lAP3YaYr/wBg28sJsOIaat5Q9pCR0q4wQXoM0
         2IgrrgDh9JpvAvTTsC5OoYW2AxvFGn0LPE2f07FRuFP01ygBq1ePLMxpCCgHYxu+PmRV
         jWl39u9Vha4UrnXTck+26XbAR7WU254ce6AE1A32BIgNVh8r9JmAc44b7ggiYRqBHyTE
         rBdQ==
X-Gm-Message-State: AOAM530cWTmCbcCYoQNDW6rxC5ptBipXLHh1lgQ75TOU27YPIxam/GWY
        CoQpT9gNzUcr1xui0wtXnAtakw==
X-Google-Smtp-Source: ABdhPJwUaYxvzdF9tgxGK9s4aTS7bd/GVjH0ud60ykGGvxiM3Bzj4h+Uw2ttOyCEqJQ/r+zbCOTKRA==
X-Received: by 2002:a17:90b:1d11:: with SMTP id on17mr338444pjb.234.1642005321438;
        Wed, 12 Jan 2022 08:35:21 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f6eb:5b26:28c:1ca5])
        by smtp.gmail.com with UTF8SMTPSA id x26sm129920pfh.192.2022.01.12.08.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 08:35:21 -0800 (PST)
Date:   Wed, 12 Jan 2022 08:35:19 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: drive-strength doesn't default to
 2 if unspecified
Message-ID: <Yd8DR8fEbCJNasiw@google.com>
References: <20220111140519.1.Ie2662d6289af1e9758b14b37149703c846d5f509@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220111140519.1.Ie2662d6289af1e9758b14b37149703c846d5f509@changeid>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 02:05:21PM -0800, Douglas Anderson wrote:
> If the drive-strength isn't specified in the device tree then it
> doesn't actually default to 2. Instead, it defaults to whatever the
> heck the BIOS left it at. If the BIOS doesn't touch it then that means
> it's whatever the heck the initial state of the pin was when the SoC
> booted.
> 
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
