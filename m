Return-Path: <linux-gpio+bounces-33104-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL/GEmQ4sWmesgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33104-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:39:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC246260D42
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49A48304DEA2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6013C8702;
	Wed, 11 Mar 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0UoSS6H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEF43C6A43
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221351; cv=none; b=Sc55ic3Ru4FE9dTBzKMFRntFwNr4R7mNrqwSiFrWgGm1mu9ZLq0sSMD+/0fUBr2e9R5dTJtWd/Pc7rPUyy11FCRAp504ipzfRul/ALkqjp2F2Hqa5FCeo4R/VRmSOopnY4A9CMhSI3pdqYAKZQGrMDQA8eyml1JG0uYR5OFmcSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221351; c=relaxed/simple;
	bh=ZLpTE+Y/R0Tdv9vswPnMcKu+W093lttl1jCB5Rb2dPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD4OUOVOTEPhaHn8NAT4aISGZj+xtEBmGIyLqa2OAjAqbzauBLNdzp37i4ng7qoNZHqpynP3dP8CWHue/vovuFOTYINBX8R1xIpD9meL1qdH8+c63x7KY0w8gxwHVjtjCplPosPeWVWYlJKpIbgKGDHgZpMx2dwBM0EOT9x/opM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0UoSS6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B60C2BC86
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773221351;
	bh=ZLpTE+Y/R0Tdv9vswPnMcKu+W093lttl1jCB5Rb2dPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F0UoSS6HeTeib+b99NgLUia+OyIhq3d974Aaz/MUtDwtuUEhhCks7o29mfOMjAVKX
	 g4uzGajiuIujzHTAQG2mA2a756hkcje6PBx9L7ejmnbdBtG24PCHfWqqllyFhml1ef
	 r7UmSxCrN/ZzCnAyj7mOocSqVm4PRXRyR9zHiUaHi1iTuO2rD3QxaNEs6dH5wMcLSx
	 j5fJu2sglWpDCXdVDVnd/6YktG/5jvPa4Iu+duoFPHRIcI9VQ18cdOSO/fFER+sa11
	 awiguuyqGhaomMJgXyyy/vixRpx+Z9ONK1cEEOXXE5oNJKJ/3T9+FwBV/RmSJjo2Jg
	 ex8YQGMIDgbgQ==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64937edbc9eso12733965d50.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:29:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTSVEQRdHYhQG1M5g3Y0qf0wvK+1rivJz+VwQbB231ppxabJDagLO5I5tdF6moVf8JCeRTlmXlroLk@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFdCcQwgqn7xmVAjOWxtbHoIYfoEdeyaf71JgNqwzil+Hh2Xm
	ZAo1oVvo0ocZ1Hoo7uiUOI8PSgDOtDrHvP4wE+ffou7ad1pJ+MOBpNmNaJHo9CgqT9Oavfz/Dyv
	p8QiX0tTmtrAWF3yYlDkiKLc7YcsT4bo=
X-Received: by 2002:a53:c751:0:b0:64a:d479:bfbd with SMTP id
 956f58d0204a3-64d6568df17mr1064855d50.7.1773221350597; Wed, 11 Mar 2026
 02:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com> <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
In-Reply-To: <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:28:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
X-Gm-Features: AaiRm52uciv83L8ui1qjVsq1iiproIcpV5iHuMJHrm82sToGHhfR4T4DzXQs8RY
Message-ID: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, cristian.marussi@arm.com, 
	jens.wiklander@linaro.org, etienne.carriere@foss.st.com, 
	Sudeep Holla <sudeep.holla@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Antonio Borneo <antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EC246260D42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33104-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,arm.com,linaro.org,kernel.org,linux.dev,gmail.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 10:07=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:

> Patch 1 to 11 applied on stm32-next. Linus, let me know if I take the
> pinctrl one or you prefer to take it.

AFAIU you *have* to take it because there are compile-time dependencies?

I provided my Reviewed-by so go ahead and apply it!

Yours,
Linus Walleij

