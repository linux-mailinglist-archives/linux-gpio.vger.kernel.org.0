Return-Path: <linux-gpio+bounces-32861-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAmIKJJIr2m9TQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32861-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 23:24:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7042422C6
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 23:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA2FA301DEEB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 22:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D604F38F241;
	Mon,  9 Mar 2026 22:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FWQ/dZZp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5636D4EA
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095053; cv=none; b=NJWoHj6MHMpcegdJFlHiQlKLljFgyJCF5oSBUQN+x0VsN/mHxQbUOH9nniOdizcKn/iNhg1pO7aPgmJEdNCmLqBHlSoLn08lQvRCZrOY5MgFM4xoNZ0T9jFx533D4QYYckCRdrCyD6M5lMDDlKaIaHBOfwoM5TABlXogeMft1xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095053; c=relaxed/simple;
	bh=p74FA63573R7vSgP0Ymlo382GmnT2c2KE5hGfqtfC/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F25VdKz9/dHhy1DG/C79gB7RwcUc74+f+3e+dnSQeatkYagOjYcfF+g0nD7hKpA/DCrzEnJeBghpWQUOJ2zW/BHZqNBt+2yK+PAYZSMZpET/0iySw3X42BAKVOrTdHT+bnjlIFyvprxVTjpkCGM6ECGoYgflL9q530unLIjFS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FWQ/dZZp; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40ea611d1a4so2725358fac.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 15:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773095051; x=1773699851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=FWQ/dZZpZ8MAhDSERJVLDYZr9GXgNv9ZhTnkIjdqAo2D2KqEojLnCVyWLzJahB2YJ1
         rOe6eckQkDVxozsaN3gSKctLYrFOiodHeblIKTTB8nGpEMWfXUmh4wIYtQGo38PulTIt
         3nfWppAgg4UX5On29+w3COYySDlEdLfo2SbUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095051; x=1773699851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=KhWkc7VCLvyKbQ6ccwpawZdvwLjsvL8O39qW9unAakfMKS9/RfCHU3MIaFKW7ovawP
         lvZ5LeQaRLqXpe4lgSTCMcGMRagygWiCgMFKmR5VDubI0waHSQ/AtESxrss1sea8c8+j
         WpH48OvweeVoVt8cOq0MNTP0t4M3CoP9JK5zQ9hUh4oysmMOxhkgs9POEbyjAOCX92TW
         cE086OQULRSuqxPUhfYi0TQOQPP0jJ3DJWjSeFSY6eIru9MUuMjC5rLyY0qNFYmwE3Ba
         dLCvCjZYUYABkuZzMeuf460h3u0vbZl69lVcXANT0iT4C0KYNkz06GeFphxV24bWTc+K
         lFOg==
X-Gm-Message-State: AOJu0YxoPLVMQ2kOpXSSpIhs4uf5kTF3kmMu9KMiec2Fjn6QmdQc0KFt
	y27XwawY+OjsAO3XF++Cnhb4/j+vO0ojwLUOgLtPwG1PLbKQ9bUQp0Mb3wyZsjVisyg=
X-Gm-Gg: ATEYQzxmEl8tFslVS6UvFhrZhzG1GUXsPHkxi10YewZ1pHTi9l1jBMoc9iMKmR21URb
	YbEsf3X13GPkB5cv8b3JZulgJyN2GIk39ddWT2eh6M3FU8SHu9RTdTht1LbO23kutR/riok25fT
	9Egn/aPbKynGMszhlFtuwReKWXQ+1DgoUgPVFzWahJ7qntM+5eWSF2/uDvaS+l/w3MN1iQhL+1N
	1rzO+fmrhK6cbbMgGIq0qyRih1oWUToPTsgO/7FUsXbHbqoNOF6IIWk4lALcGqFlCZYKS/igXxJ
	Sjl5biBIx2hTFGcRePF2MuSjnk0Zq0F1BoJ4xFrD54pTJ7sqIlcllJe5fiz4WjTIzMQtosE+yvU
	fUfjWKNwFgRpA0uITozho+QllPAgD7PbqQXVilV5mrdkbsbFsrkI4f+e64TDt0oB1RhCrcaIaMr
	5ida8l4tWclY7m21c7Kxn1lsRmHYd6vYPTq2Q=
X-Received: by 2002:a05:6820:151f:b0:677:d91c:2e26 with SMTP id 006d021491bc7-67b9bd3a2camr8004764eaf.51.1773095051333;
        Mon, 09 Mar 2026 15:24:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67ba42709e9sm5372733eaf.0.2026.03.09.15.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 15:24:10 -0700 (PDT)
Message-ID: <03136b99-1bcc-44a9-bfc8-bb4ee96c5414@linuxfoundation.org>
Date: Mon, 9 Mar 2026 16:24:08 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
 <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0B7042422C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-32861-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Action: no action

On 3/9/26 14:55, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
>   Documentation/driver-api/gpio/index.rst      |   1 +
>   2 files changed, 267 insertions(+)
>   create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..0f0a3ce3806b
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG Protocol

Let's expand RPMSG for the first time. Looks there is another
RPMSG acronym that is completely different.

The rest looks good to me.

thanks,
-- Shuah

