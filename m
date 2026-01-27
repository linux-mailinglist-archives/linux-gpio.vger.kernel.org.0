Return-Path: <linux-gpio+bounces-31127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMoHGVmEeGmqqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:24:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3D91A68
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D26FD3036ED2
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75032DAFC2;
	Tue, 27 Jan 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6ueMY72"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840AB2DA76A
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505748; cv=none; b=jiNTauYW68La9FZolJsPlgmzkfYurz326QS2OxUz1dKBlQnITZEnsUj3BKulMZvkeKuyvojwl9/u9Fe34EjtzxwfS6FDY3kD4cudQSpvjo0SfgG6bK9kROZ47bB8yJyfXmjEp7x/7YFwOmz5Tt5HWGo/H0qtTGCoxsC3ueJgzNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505748; c=relaxed/simple;
	bh=1Mzkzhmf17O9Xkx0hZ6VF5j9tJzlhe6IqtMNY1iqJLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxPeX7tnXen2bdQXcay0IBfTjD0wMJf6VsrWWUblLJ7miGagxtuTu0rvMKZHu+u8qjJvve2yLcoMmkLbHMBsXMi2Cm1NncOiEf59Hmb8E8La6lv3OjeinWp7qF3L97MpRYY5wicDY5Fo7TDxoFT2RPnqob+zXcv1w85XI3Ipgko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6ueMY72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B326C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505748;
	bh=1Mzkzhmf17O9Xkx0hZ6VF5j9tJzlhe6IqtMNY1iqJLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O6ueMY72cyAl/I2bdA2DIP8HfzWCj68lloHCg/doi4W47Fx+TJnJNp+VZN2E9tbZ8
	 1C8moFGl/Rrqi1jNm8rmMPDHzVzEgBq/RY4m1N1TNfg2sArtn41PdyjKzB2XN5zm5A
	 uTZu67OijsJ/U4qap+5HF0EbxEYLQqlkQcsNJoFhztHO729P3kL9nLOhuEdFzDyErT
	 /hXQ352S7HqZwWvxpbeFDr20L8l9a1yfRKkNWY41SWCCDsSA/q9qVayL3Jkxe8AFR/
	 Tw8DyHCMyA6Ficx4UsuquFgtYsLhXo6zcMj35g3XiAI47xBHEXEGO6fFLE/kf0Ib/T
	 UStg9G3GLJgCA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6496804204cso2507147d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:22:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiVLXqNn/wGPfU9UoFl0MMnBxkne+TkbGN+f9lRT8ViKXboSeHwxkg7zSOtkGH8JaAa0Y8APHE2rYT@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6O4Qh4YnrfgHUM1FrTmxOCiO+CWSPKiXtox5vT+tvX9zpZyG
	x4ZGyRM9yj2sHV1VKJ3T5YN2a7yZZRvKoqvkiTCesU7Qv3KlZmkSt4l3oAqxJb3A1Vqoa+vZKOn
	bCas2Gj7cNTuvd+XAJFj7FJvGoFie97M=
X-Received: by 2002:a05:690e:241b:b0:645:443d:10a2 with SMTP id
 956f58d0204a3-6498fbebe0emr414264d50.26.1769505747439; Tue, 27 Jan 2026
 01:22:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com> <20260123-debug_bus-v5-2-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-2-90b670844241@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:22:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLmr-O-Mb_MEK6LWdhY75=uteLsN9MLrtOvFaeCj2B_Jgw@mail.gmail.com>
X-Gm-Features: AZwV_Qj2UaMXe95o5XuL0t4M8bbZMFmvBg1jJ_pK4foc_hf70_XCTYpnwMAEQeE
Message-ID: <CAD++jLmr-O-Mb_MEK6LWdhY75=uteLsN9MLrtOvFaeCj2B_Jgw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31127-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B0D3D91A68
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:40=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> HDP being functional depends on the debug configuration on the platform
> that can be checked using the access-controllers property, document it.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

