Return-Path: <linux-gpio+bounces-32535-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK5BMdVBqWkZ3gAAu9opvQ
	(envelope-from <linux-gpio+bounces-32535-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 09:41:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F6320D9BD
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 09:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BA0F3039894
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 08:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AFE372EF8;
	Thu,  5 Mar 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRkkU7Kb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA9C2D97B5
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699840; cv=none; b=bDvlk5KARVFwzPhnLa2FGTnklJag12qd1J9mUdZ0bs/ifjxnleUojJfTBJJQe0DAyPSj9E9byo0Rq4YJDsiV0Hwg/E1ObmhGXAlmkhk2+TkibW0V+1GSfFSYg4o80R8I6KNvJupSJGi/Dk73PRMAYE9vOWJImZsJFewvz5jmM5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699840; c=relaxed/simple;
	bh=vBwfz6nb7V04Zex1Q/I6Ry9+osKgyqMA6O+uWBudYFY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DF39XrvX6Porawc3XNgmh6qoWI7TALYnkF8tCcGEbBXASGUvb4HuwaOsh+L7Xc/GMC0Rt0eWvMZpwJp3rn/YyUTpGLv5UbBS7CmkW4Af5q1GvIzMo8/6vaf8p5SANzudyDBREdaKqzrsBUVzLCEErxyllAT79B1pF6feSQqCQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRkkU7Kb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE02C2BCB5
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 08:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772699840;
	bh=vBwfz6nb7V04Zex1Q/I6Ry9+osKgyqMA6O+uWBudYFY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=mRkkU7KbRxsoDedZRYe2vbvmtsLRw42Yx01n9ZuPHw8BGgc8uCD5yFlR1kl/Rstum
	 0XBLpc7EbcPtRi/H4qj01+Eo2r8vAzXmuMeEqr+PBkrgK84DnLhmpaUBfonBARNMdz
	 dJaS1+NtEUlBitoCPZFDGoN4Fr53mRl00mP4ErqpTZi/vXUT/k9kXH7huIhU9iUoE/
	 g4xjbRr7vPHVZjfpQeH1jplfHhvsR5BUDIHWems4UixntCdNDGzlF79+e7G80ayyNO
	 l6g0tRxL5TFza5dtOwn7SeNSZVcY/OcPwqUC2xOFurMR6tlGcL/Dtc7ocDsaE7oii2
	 +65niECv2btKw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a133b686f7so415948e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 00:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPjfBgUHQUcrxj6XrmjPlMkvXciHY1XktJVSp4Mw25XOTh/g1oQL937Vjo0AqIBa4+uUuXjdPT+N3+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mKmch+wpj2Kml+zEuK3jsZM0fQ8aaecmfIeGc9FQfmxm4aSV
	VpSXSCKz3SCscfbbcAXQq+z38jdvP3ko4+4kS05NjVR7xb93AQpsnKJyydjbExgZ93GKGvSHph1
	AdmVKkG33qb00ElVFrj2Nhbj77pYrulmugOf3qdhMrA==
X-Received: by 2002:a05:6512:22d0:b0:5a1:2ce5:8a79 with SMTP id
 2adb3069b0e04-5a12ce58cd8mr437459e87.21.1772699839218; Thu, 05 Mar 2026
 00:37:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Mar 2026 00:37:18 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Mar 2026 00:37:18 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-topic-sm8x50-spmi-gpio-get-direction-v1-1-a25612161fba@linaro.org>
Date: Thu, 5 Mar 2026 00:37:18 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mf1jScfaR6P6uR80OOEf1nn-cKV9xLCib41WvNF2kWPrA@mail.gmail.com>
X-Gm-Features: AaiRm53IylXWbk43mI-2teezP5FX22EcPWZvZg6XPNJM6rNOP0nolNzLcgELFvY
Message-ID: <CAMRc=Mf1jScfaR6P6uR80OOEf1nn-cKV9xLCib41WvNF2kWPrA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: implement .get_direction()
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh@kernel.org>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 70F6320D9BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32535-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 18:41:08 +0100, Neil Armstrong
<neil.armstrong@linaro.org> said:
> GPIO controller driver should typically implement the .get_direction()
> callback as GPIOLIB internals may try to use it to determine the state
> of a pin. Since introduction of shared proxy, it prints a warning splat
> when using a shared spmi gpio.
>
> The implementation is not easy because the controller supports enabling
> the input and output logic at the same time, so we aligns on the
> behaviour of the .get() operation and return -EINVAL in other
> situations.
>
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> Fixes: d7b5f5cc5eb4 ("pinctrl: qcom: spmi-gpio: Add support for GPIO LV/MV subtype")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

