Return-Path: <linux-gpio+bounces-33817-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKTbFYH8u2mzqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33817-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:39:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B88DC2CC181
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0487231C38D4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AA83D47DB;
	Thu, 19 Mar 2026 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeL9dqCg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42E3815CD
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927489; cv=none; b=FiI8EWeix3qDZVUrpLROFoP0jVLgVOTI160hYi1C2WAQypy2v5IgpOecjrOPZn8i2z58ukhv0MW8cx5R+kyxM1asxT/hPOj6nI5PlcOAss7X6tgvSRFofzJQa/fL9R6U3rlWbNiIjGiWnDpVLQTwi36pdxnbSFMdYJB5slgQfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927489; c=relaxed/simple;
	bh=u0WZcBFjGfVVXTR+0klsgR/jkNeMF8nCZsqQ5gYd60g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeyMgcPi19hB6/tlvw07XRHUqU/EfOBN4mOD8n0CbBc6vIoCwdkRt4kzd/6jI2CwxILtwd/4bBV3jUvDXJOL2pVM7MZr9u8r9OmkMIeYvEdwG98YcZOXIHELTshYSo23CgmqKSJrPshmghEe5YoXthyySN+XFocYUDspgt1mNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeL9dqCg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AA1C2BCAF
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927489;
	bh=u0WZcBFjGfVVXTR+0klsgR/jkNeMF8nCZsqQ5gYd60g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KeL9dqCgwJZ5VvGWvCrCaH57QKHEMs57V78gGtqDMeSWyf1iBR6Vhh+DXCYGFQZrT
	 4ySWgP5/Q60fqCrZy5+0go57lMRJ5vMdCPPq2qGA7Sme/E7wM8zt6y1SR5Jc4IQVrC
	 yDjPAF2EGkTZI5uYkVSaO6RmejMbg70Y1eiL7ycsxojvqOMMtfP9WVSQmDG4S46Et5
	 SttpOlQKnlLPy72UwANXXm1/fdcROyXOr+LtUSuwL/zo0i6MhO30J1rc3YJcAlO3Lb
	 u2Xf/iMz3RsN3Y22by/a+GWP+it4IcF4IzUuhwo2GgmiS4Cq3N3MJg6SFLIO0HKr3q
	 1AOj2b6JiRKiA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79a40fb9890so10879337b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 06:38:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YxtNWDQiaBPFArLAPtBBspMJ1xnX00083dLHE70bwV6mPOfYpTp
	F/R6/8/NrYjB5b8SaEM1vpnf0sM0ZGxkRZ/9WaflnjNf2rUpo4Zqvb0itLKCJNj+tDejjixlHjv
	J64IinZQwGa8FpGxPb96BaY8aI9Z9dx8=
X-Received: by 2002:a05:690c:9988:b0:79a:5961:c804 with SMTP id
 00721157ae682-79a71abd766mr77845987b3.37.1773927488750; Thu, 19 Mar 2026
 06:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-vigorous-steadfast-04afdcc9e524@spud>
 <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com> <20260316-verify-revise-c0ad49fc208e@spud>
In-Reply-To: <20260316-verify-revise-c0ad49fc208e@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:37:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLkdDs+KjKq6BVT6e1zEtNwVZGiM7ZDS3e7AmiD39+d5WQ@mail.gmail.com>
X-Gm-Features: AaiRm51u5GOrVKK05VvMFBE_XzpbQvYNev3NWNBlgtGjZsi_ytfM5HqScEcM800
Message-ID: <CAD++jLkdDs+KjKq6BVT6e1zEtNwVZGiM7ZDS3e7AmiD39+d5WQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux driver
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33817-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.733];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B88DC2CC181
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:59=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> I'm guessing you're not looking for looking for me to be the arbiter,
> but I'd say that the muxing aspect is pretty important!
> On a serious note though, the lack of anything in the hardware to do
> masking etc is key, it'd have to be nothing more than a register that
> determines routing.
> That said, even the simplest mux should be an irqchip if reconfiguration
> after probe is to be supported.
> That'd make the delimiter "a simple mux that you set at probe and never
> touch again"?

This definition works for me, as maintainer I really want to be
able to determine how a contribution should look for each case.

Yours,
Linus Walleij

