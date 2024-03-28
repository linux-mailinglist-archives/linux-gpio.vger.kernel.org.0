Return-Path: <linux-gpio+bounces-4750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0588FAEB
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 10:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A37A1C27B4C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9795812E;
	Thu, 28 Mar 2024 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAEmTYP5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C433537EF
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617416; cv=none; b=dXT6r6FPGbRzP0DXZ5Hgvo19UWVyZV3dx1FzRVCK8pGrA4aPhyIOc3D7WVeM4LblXVxnKZrH6FD0iYHbSbMX55SBLs2KIYnMeIp5o7FokK1K4sQIcAA1en7doHtXNVI4ZZO1H9Wwxc5CqGIN+Dj2RNvrmQR+fWNoxGZqEl6wfmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617416; c=relaxed/simple;
	bh=W275z/IWuD11PMCB9o4TcgDN428EIWjLe3KPPkx6rzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMus/rqvmt5+SyANYGes+pYvRTWPlAyuwNvPv37Aor4QS09lNTmHz2DTTSiFpJeNrfTNto8aI7wc75YqEYre+TR25mNw+Qo0MtpptBy9flKYhKhXcFE/rNOVbsxj31XDC0EZ/pLKtwl3vYiUKdc+m06IFa4mJj0BO9it6NPv/Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FAEmTYP5; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60a0599f631so6482757b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617413; x=1712222213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W275z/IWuD11PMCB9o4TcgDN428EIWjLe3KPPkx6rzE=;
        b=FAEmTYP5X/26sh9oCve6i1z5bkmVJmZUnLhZ/kTBsmidosM/L2rpci5lyZlX3L4qiY
         xEAfApqFCdauvyLfdVEQQPStonDu3XZFV8Pgy8fw7bdXok8BBKFUMxYlIfA4mu7LiPL9
         /SWFjfHnPxbTo1sFEl7UVpxOrBd/g5QEoRC52UkV3dkbygG0OqwIPz73JbJAlHgl4+j3
         GatM+JdMSxI7GQ4SFiHrf4c6Uil9P+qxy9RGn7e8QDoaaf+OTNGROCezgihPdnZ8I2Ln
         FU28GwDoE6MUR2upyefabuJ6WHUNJnz5iPCHikum/OnmnCJJw7hVTwgHDhF7ayy5ue7g
         X/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617413; x=1712222213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W275z/IWuD11PMCB9o4TcgDN428EIWjLe3KPPkx6rzE=;
        b=RiH0CT2QfnfGIB+A+ZJpy3L7jrYxytVgg9UBoeR/mHda+KIZ43owFnUi12U42UDAkc
         gYU7Ocqvs/wLdRxyLCgSgvL1lFwk65/edSBeDNfLZ/8eTmo9gfE5cvM4xyWXQGOc+Xdp
         njgJD7vaEp9ybk8rIPtty6G8Mv/eCM3wt5ApS4q5UmgQ3LRqgxA61alBkhAyf/POiAH4
         5QQ5/bmcpO8RaQRBZjnCxqZyEhNYSyMYGGfKzcK/aRq5L90D/d+/mMlmjbk+seRvkApH
         HxcpdZx72gj5fMRbfnfAX8vwAsCMfUBI7luUzYpOOzJaHn+fQDIbJerlQ+aAZatBP38M
         q7IA==
X-Forwarded-Encrypted: i=1; AJvYcCVffIiUucHLvzC2Ma8gc6jTo/c4EuqIhSmHJPojjEpHrYyyBWXubzzIsrMRhHztqpVdsSUubFfLkNhzoeeL7GUmyRzdLOnY3E8gng==
X-Gm-Message-State: AOJu0Yw/On7/0kjGy0DvQ9nb76dNoxtWzBhezFLb+HtKyv0GUGpePgK3
	3d0UxI1DRaTlPSOyzebSkvqqOdK34tcNrP8rbLA1Mx4JGku0vg+IvnFjMsfvPlcbz4UrWPUANdu
	S2/bW/97k5EK7n+kgSskjAQAR6/XenMPKzhUdaw==
X-Google-Smtp-Source: AGHT+IHRkTf8inGn2mE27T4DDRAM0a3h+ktBujX/BRlohTZAhDo+tStkRZRLPI58v2EqcZVGGY+9kbz/nNjf253kWd0=
X-Received: by 2002:a25:6906:0:b0:dd0:c2a:26f9 with SMTP id
 e6-20020a256906000000b00dd00c2a26f9mr2067038ybc.27.1711617413679; Thu, 28 Mar
 2024 02:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313024210.31452-1-Delphine_CC_Chiu@wiwynn.com> <TYZPR04MB58539A1D94340F330CAF3CF9D62A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB58539A1D94340F330CAF3CF9D62A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:16:42 +0100
Message-ID: <CACRpkdZuSdkTXBF+4P1gMD4p4DsOJYivgrquuXas-R_UKg=JmQ@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: pinctrl-aspeed-g6: correct the offset of SCU630
To: "Delphine_CC_Chiu/WYHQ/Wiwynn" <Delphine_CC_Chiu@wiwynn.com>
Cc: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 7:57=E2=80=AFAM Delphine_CC_Chiu/WYHQ/Wiwynn
<Delphine_CC_Chiu@wiwynn.com> wrote:

> Please don't review this patch since ASPEED also provided the patch to
> fix this issue.

I added your Reported-by tag to Billy's patch since you obviously found the
same issue.

Yours,
Linus Walleij

