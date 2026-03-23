Return-Path: <linux-gpio+bounces-34006-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COehIwUQwWk7QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34006-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:03:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939E2EF9D9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20298301BD7C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D017388E55;
	Mon, 23 Mar 2026 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWW3SvkU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CED38839E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259916; cv=none; b=LHu3CPwNdYYj9tEntcwUMhQy9dutLXC0sIi9hBn8Ckir2zXgwOftzztlidK4cCPxId5E02BoGvYr0aBxF3ip1q8PNWvazccsZ62lNDloATh/u/IDaploONzhKGncLhIx41ff04GqGePCcgy6Z907wZq9fozlB82ONLC6ix9h5TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259916; c=relaxed/simple;
	bh=gp5lHYOOO+4yiL81Ex+mUjPO6eOH6Qpek1Pg4LH9pn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaC91hIGs57E9NlwGM3+kgPDxEzmb+sjXWtM+iEPVzbxUqFOciwCZlafOAuzMpmIaNQJ7q6uMDcEnEdjfpyVZJ97pEY4wXfFkJzIFW6r6FQDq5q05sUV1vjgfDmYDaGVwom2x2sZ7yZOidvVw4LAdtFxvxbY+VHOzOkfRKgKA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWW3SvkU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFB1C2BCC6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774259916;
	bh=gp5lHYOOO+4yiL81Ex+mUjPO6eOH6Qpek1Pg4LH9pn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VWW3SvkUU/yv0MRfe4JmE2kDnaToOtuQIqVsqIHLlw1gxOEQZnC41Qs9VN1Fc1oJ9
	 gZDJ5sfIfYKcJTLJ5JeqReZiBl3bIiXD38ViE8+3a4gohu7VXq1D7sBk7a8lgnAUfQ
	 L9yKrN/IVtB8JHgkJE9cqEmGLNngzQwHR2FHSPPM3Df2xlt7L9Zxv5ACpcNAUKgJu2
	 wDiGl2zqDMenBTlCZwUjgw8cr16ywBiUI87mWmMTDnrZMBzvkphzDMhR8OxYxVWG0C
	 LhGAx21DF/nen2mwblfGCCt6EEq4CHO5fPYCAVUwtdQnPcl0WTEU/HWxW1mKGry3Ng
	 LYCPB3T/IreCQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a3066b68bso30257851fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 02:58:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+AvdrME+pA8By+4zbAygDC3S8S7gQT122+Y6YvaXJcSjO60cJrHKzAhOK8qg3FiN7nZpmi3ImtJ8k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6C764wdn6ckkrNck2/X+B/4VKwwehDn9OEdzwwWxZ4nSB+81
	9JWmyApdl3CXWjpCO/tc05TJGAHYfGVEzJzqpXKU0qtLECDtVY8wwvbBX30x+TOABymh7RdyPo3
	nkMFcMly+l/Y0Y5dJmGSJyvo3T0geM7faCDqfBDutLg==
X-Received: by 2002:a2e:9586:0:b0:38a:1a50:d843 with SMTP id
 38308e7fff4ca-38bf9747572mr29235411fa.36.1774259915139; Mon, 23 Mar 2026
 02:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774087290.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 10:58:23 +0100
X-Gmail-Original-Message-ID: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
X-Gm-Features: AaiRm52YzNP-I9uAP5hlyzM8oeYE45CPVBux1vZ_-ak3oMBioBxm2gy2IoiTfBM
Message-ID: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: introduce a gpio driver for SCMI
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, arm-scmi@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Dan Carpenter <dan.carpenter@linaro.og>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34006-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,arm.com,linaro.og,lists.infradead.org,intel.com,oss.qualcomm.com,linaro.org,amd.com];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9939E2EF9D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 11:13=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> This basically abandons my earlier attempts and goes back to Takahiro
> Akashi's driver.  Here is the link to Takahiro's patchset:
>
> https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linar=
o.org/
>
> v5: Addresses Andy's cleanups to the driver.
>     Adrresses Krzysztof's comments about the dt spec file.
>     And almost all the subsystem prefixes were wrong.
>
> v4: Addressed Andy's comments about kernel-doc
>     Addressed Rob's comments on the spec file
>
> v3: Forward ported Takahiro's patches and added some fixes ups to make
>     it work on current kernels.
>

Once ready, how should this go in? Immutable branch in pinctrl and
final two patches through GPIO tree?

Bart

