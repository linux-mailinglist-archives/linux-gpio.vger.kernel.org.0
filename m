Return-Path: <linux-gpio+bounces-14838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D5A11F46
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 11:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44841188AEA4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 10:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4355823F29B;
	Wed, 15 Jan 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OTC7Rn79"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50851231A49;
	Wed, 15 Jan 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736936738; cv=none; b=NqADDGHijRUJrbXgMii0sI2WCujolrS2drSxMwnl3LyNlL572zqI7cuaIFJteijZemGd6aWyS0L9LmWLRjl3aKQbK6Cd21PJj/UyMVAHB7/sL3sE+FGcdm5JDfjWCGW6WWIQpGXaJmHAQ0Sz/jLHJfImtybnB4OJGRadX4oOjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736936738; c=relaxed/simple;
	bh=/6gnI4FevS4kmFFgJfFIyOUpg34TMYOQPWrzA9gsD1U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSmhqqNdUlJpJ6To+O3vp2m4bN30H9UavHNHLLsfQYbS2Igj6kl104nBf5sAzVgCWQFcor/ygwGmro46EjgC9NPlDJzu/lHw9F06b4PLhxrEk+dTvRNHAfkwuaxZSecPrfi8x32AcSM7XkLmNViYEA70N5xWrcv1+sAYCBw4CYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OTC7Rn79; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F10new023378;
	Wed, 15 Jan 2025 04:25:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BwBSIk74OQkD8K05wG
	C9E85ouIOUoZbue+TY8sE50NU=; b=OTC7Rn79ZlLG9B6zXwTbutpaqqWA5IYAZn
	xXOLqPfR3tldRuqMPbOI7fq7BjmpnwPaU+s0XEHdzBs7Poy/5JcAplJ2HK4VoQD/
	lawzjifOmRqHrqi4CPSCnC9YOSGzjsL6YxcwgPMs3x58LugwlRY2vP7KAckUXpbh
	XnBwWsihA3xhZKWygMp4HX18UA7J7mNqFdDPLQTgaD3l5gp2DFVTETQh1a1GX7AJ
	ObbVJYVR7akDB55uE9ZQXxegH6MJqRzPxgp6+S5HUZqATiElf7Zcr3FqIrABeUkX
	TzDWisNVbYg+bNwoDgaisDzutYegcuwfXoAVNprXbZkckt5OU3Wg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 443px4mfaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 04:25:19 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 15 Jan
 2025 10:25:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 15 Jan 2025 10:25:17 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id E85FA82026C;
	Wed, 15 Jan 2025 10:25:16 +0000 (UTC)
Date: Wed, 15 Jan 2025 10:25:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans Ulli Kroll
	<ulli.kroll@googlemail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
Message-ID: <Z4eNC/wWsW5mxkmN@opensource.cirrus.com>
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: JgCM6RfomLyrgsV5M_Ad-wIhmpzVbKEd
X-Proofpoint-GUID: JgCM6RfomLyrgsV5M_Ad-wIhmpzVbKEd
X-Authority-Analysis: v=2.4 cv=XdhzzJ55 c=1 sm=1 tr=0 ts=67878d0f cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=4kLLQdw-iMVuSiU5jB4A:9 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 14, 2025 at 09:36:02PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

For the Lochnagar bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

