Return-Path: <linux-gpio+bounces-32898-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkaGSDir2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32898-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:19:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0521248326
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A41923039340
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AB643D50E;
	Tue, 10 Mar 2026 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g814FukT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256643D503
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133979; cv=none; b=Tlxns/K3kYB+yaWkxRtEb3Zdh69RS/fh9FJnB2//tX39jpJdCTTi6oRSVuRLr34GAg+91Adj3VCWbvk6uXXFul7Ijod2IHbT6i7nZpfXzcKhLFH3q8Q48xoBBv+NtThWj2yFQVGMoKnNLPjOjykH0jBSN6ok57MPAlVdXJMt8vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133979; c=relaxed/simple;
	bh=SlG2X1MsNLJZDpC5yd0xN1s2UyPhvIuosXiu7aDhfXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjBchnXnO9g1Yv7hC7g0GCnmyS5tqPsf2az5MwU39S+tf95OOrJrR4fjrYNR19YWZBdOnfyuGTdW+6SkJBu7Y46/UqrFzK3PzuACuom9hh291GiklJnd0L7IHw5yC9ns0HSC86SxmWnLtqwLDv1pzQJLkSsknxEIqKFsfOq40Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g814FukT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF01EC4AF0C
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133978;
	bh=SlG2X1MsNLJZDpC5yd0xN1s2UyPhvIuosXiu7aDhfXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g814FukTaiegjb/q2Avvbap7tSW4OBpV8gM+1EtkCwkU7RWCAsCUCLlp0++zQnXJW
	 FoAYe2bBYy4hdPBRLMPb6SRqNftTlNk0x/qm9gS4GVd9blKWabqYq42ylaBkrvPqiL
	 n1pEoIh4tJDrjEzdHQxhNTyb8xmiXfCwJuuW7YjCYn/9JYxc6t1+/9M3blHpJnGc+o
	 gXJ2lOq5kawgP69jWx9ARJOMtWwo2zTyUQRh65HG8QLNQd+uuQaGHhqFKlYZmie7o1
	 p+lAes1507Ct7b0yKmdaylHCVLeKJxfk24ighSfX+4wCDzC7ZAE/tu1uQADQjUnBxu
	 2fisEwj8LLVrA==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso12326931d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdH7lTH0SAnOGLCXTCWpNP0b6rD5xAhG6exgLKwqRmsDdeQ5ZqKnhwDPDxgsU1xy7GY9XRAMoIRNUO@vger.kernel.org
X-Gm-Message-State: AOJu0YzhhvsI33nn1TW0Ansieo3FIkXjQDmwzf7JLuchBvPVthdLGIe8
	Tgv/bNgJidrYyVOPBpMhBWxv/1ZhRtKsYvqpDZLMEUZ83cjZFqG+aGi3h67wC0C/3BZe+Tpv1w8
	JkldBprZTmjDdv9W5hJFU4kz0HNWuwqE=
X-Received: by 2002:a05:690c:6207:b0:797:db54:b876 with SMTP id
 00721157ae682-798dd79be8amr122976727b3.43.1773133978102; Tue, 10 Mar 2026
 02:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d5aff6931bbc95a16f049163c682ad08d1f0f04b.1772701307.git.geert+renesas@glider.be>
In-Reply-To: <d5aff6931bbc95a16f049163c682ad08d1f0f04b.1772701307.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:12:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLkfaOz4iJr1Hi5K4fFMgn=A0-VnKDiLs_jbErREUzGuxQ@mail.gmail.com>
X-Gm-Features: AaiRm500SYwPL14hT0esMfgRmgXoG5VkO5n959dPpnVPScb2gRpeSraaQj80e5s
Message-ID: <CAD++jLkfaOz4iJr1Hi5K4fFMgn=A0-VnKDiLs_jbErREUzGuxQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP S32 Linux Team <s32@nxp.com>, linux-gpio@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E0521248326
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
	TAGGED_FROM(0.00)[bounces-32898-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,arm.com,pengutronix.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,i.mx:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 10:05=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> i.MX95 SCMI firmware is only present on NXP i.MX94 and i.MX95 SoCs.
> Hence add a dependency on ARCH_MXC, to prevent asking the user about
> this driver when configuring a kernel without NXP i.MX SoC family
> support.
>
> While at it, relax the dependencies on ARM_SCMI_PROTOCOL and OF when
> compile-testing.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

