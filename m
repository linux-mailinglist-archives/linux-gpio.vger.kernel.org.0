Return-Path: <linux-gpio+bounces-34932-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBskA6pp12moNwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34932-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:56:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 522DE3C8145
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA22F301A69B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED503822BA;
	Thu,  9 Apr 2026 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnV4tPsK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB837BE85
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724820; cv=none; b=AWBb/R5o0FWKiwhBNpNnxK/4rt3egEuNuFzFLUsIxqqFCmmwuGDCUb/QFBITIhBjFNquEo8uGi5anvSqxs8WR4vzeioEC5kRtGVW+FcI/CtDiu4WOlgGrzqy7pMThSjHwHw3UJlZ0d3gHmVJq0+qwPdmUyyVT+CwLXj0yriC65c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724820; c=relaxed/simple;
	bh=+gnYadLPiXy+5pNfg8GvSB4jJxsEx+b65W3ka6Kxn9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEe7Q1AJsAnEGmpUnWxpyq/lG1KHzoa3sS9NA/CUnNaV027APDjDTsetVTN9Q8pCn/HTR3vOzyVySxR+zEzHtPEdoONV1lI7U9XqZYAKupbNlaGJT8GF0RNuA6Hm+jDEsCNtiRnsLtsqwe84aLuHYOYqtpgNgFoqFbcPCIQVne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnV4tPsK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FA4C4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724820;
	bh=+gnYadLPiXy+5pNfg8GvSB4jJxsEx+b65W3ka6Kxn9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hnV4tPsK/NsT1jjzDTn+Xrrw04dglbAqMClXktPPbAvdPcpoKbLLqxZL50vuUELSk
	 4Hj7zHz8ROv7Pjj6O0XQrpBs4kqt4I3g4TEjgdu4h50gnXrlwHKJ31AxzQQmGVnwC3
	 oXCNWK6v1b5S7iBYMWLGjcU6zSzfPi8ZGwB7CGHfgJ4Et5qwBZV37Q9NZaidQKnQPc
	 izqUGnN2W4aDVPUbq4QtmYSLo8tysZTIveOQKrEacxtA8qgASnTkS66rb7EWQC7PQU
	 d1rSoxl8CZlKpUAsZGO/UMczErV442grgX4UIQdhmECtiLMC6hSZv8KfcGlBogCcNP
	 bDjuWCq/aRPzg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a535e7c00so7178337b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcu/jgsJv7VBDruqaC9p/jo+sVP0b3Qbc+GGecNp4ySnKBmllAaY6wlQFhmfzQeMkNFvcKX/IdbGWj@vger.kernel.org
X-Gm-Message-State: AOJu0YxtR0jcNL2rpIaxH6K7GbipUpI88EjksyNL3Lr5A56THkGeaFo7
	f0fut7twtM65sMcVHe6Fky5IG3gDtn5SCsehgkpwFHpg6ZwiqjJ80F0PAlmuTF9LOVA94BRPtxz
	ku1awHT4CbUrahfPQs4y0PyyNDq2WzYY=
X-Received: by 2002:a05:690c:9:b0:7a4:e4e5:38ba with SMTP id
 00721157ae682-7adf314ac35mr30273177b3.45.1775724819767; Thu, 09 Apr 2026
 01:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
In-Reply-To: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:53:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
X-Gm-Features: AQROBzA6XJGRgSvcnO-lnO5vSscUWxOTlZ4i6TF-QZ3gCocWNhYISa1pZoKedJw
Message-ID: <CAD++jLkVHZOBk3bgdqk0dX2q4v=+CD8jC+1vu2gi8CK9BLfX2w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi SoC
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34932-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 522DE3C8145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 4:16=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
> Qualcomm Hawi SoC.

All was reviewed quickly so patches applied for kernel v7.1,
because why not.

Yours,
Linus Walleij

