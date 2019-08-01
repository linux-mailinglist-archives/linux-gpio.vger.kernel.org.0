Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3673D7DDF8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 16:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732080AbfHAOfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 10:35:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37687 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731205AbfHAOfH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 10:35:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so34184297pfa.4
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2019 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DBbtWFIFaoHfS1Xw8mVY2gGo1qmmgDJlGuvygEHXUSo=;
        b=ukzC1YlMrKl2Zkd5ltLu7k38qHxpiayU5PA7l4B3HV4Ggt7CMpLcPXepfvfa4mCAx6
         hsDWKt/DJD1zmpEooC/6Jfx9xzftaBHk92AXK9e4HivbgwDr73UwFaluSm6Gy1uAtI7H
         FUjGfO93eEafY6Kw9UYJN+aib0XGSsR1s2jJn53hob72yPf3Sx7GqVrObZlPQrJITD17
         ezgCxQoiSyqF/lwBINmAVySErBakC4cjvvZ4x4lBIHS02tRcPdUPLMhaWRXkbptlX99U
         CJPnu53ZP5q+XqIhpb742rx3MqeaNAFfi0Jh1f1X7Hoc8kmv513sBhnSQ8lVXA4u0q4r
         w8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DBbtWFIFaoHfS1Xw8mVY2gGo1qmmgDJlGuvygEHXUSo=;
        b=INRiBLVtzO4HybSelqAAtgP9CbAHfngsl8XYWLP2pYlEudJf3qY0q+O2EHkRQihIu+
         vsTixoIieszJFMXleF/n9m1Is7jv276p6c/rCGf/isfoZo3X71gw2pVwVf764TM6Io+w
         R4qWblq50xs/xU0YAmqMYd9f6KLxpcRkClAgCKK0PfK7WCizGmuUYeu3YJB+xDP8lnp6
         3shyBqy3CWrRZvCtlay7zwkMWLfHh4lIslizCsVocWjsKiOC9Mr+Fawf59jwBPXL0m0a
         ySNypEnf9VAbZLaDES71wm6Ien+rAg5xFSBMuN16m4d4BM115vGQJgAoUQfbnCNBABLT
         lHfg==
X-Gm-Message-State: APjAAAVW45AHFHTrLu0JkdYbUVjODRzs2BSyBX+6+uqhvg8UWmUjkNuG
        wxoheICp1O7SXuzJuNk6uhWqpg==
X-Google-Smtp-Source: APXvYqwXjf/7RCgtzVuCUVWsIvbZmbJwE7lAnb0Yae4AD1ql1RRC/pTcWA7lSmMxEe40EKRwaGIa+A==
X-Received: by 2002:a62:1b0c:: with SMTP id b12mr53059309pfb.17.1564670107026;
        Thu, 01 Aug 2019 07:35:07 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o14sm5101778pjp.29.2019.08.01.07.35.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 07:35:06 -0700 (PDT)
Date:   Thu, 1 Aug 2019 07:36:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SC7180 pinctrl driver
Message-ID: <20190801143637.GY7234@tuxbook-pro>
References: <20190801100717.23333-1-rnayak@codeaurora.org>
 <20190801100717.23333-2-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801100717.23333-2-rnayak@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 01 Aug 03:07 PDT 2019, Rajendra Nayak wrote:

[..]
> +static const struct msm_pingroup sc7180_groups[] = {
> +	[0] = PINGROUP(0, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
> +	[1] = PINGROUP(1, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
> +	[2] = PINGROUP(2, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
> +	[3] = PINGROUP(3, SOUTH, qup01, sp_cmu, dbg_out, qdss_cti, _, _, _, _, _),
> +	[4] = PINGROUP(4, NORTH, sdc1_tb, _, qdss_cti, _, _, _, _, _, _), [5] = PINGROUP(5, NORTH, sdc2_tb, _, _, _, _, _, _, _, _),
> +	[6] = PINGROUP(6, NORTH, qup11, qup11, _, _, _, _, _, _, _), [7] = PINGROUP(7, NORTH, qup11, qup11, ddr_bist, _, _, _, _, _, _),

5 and 7 deserve to be on their own line :)

Apart from that:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
