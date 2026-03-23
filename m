Return-Path: <linux-gpio+bounces-33997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MA1NEUCwWlUPgQAu9opvQ
	(envelope-from <linux-gpio+bounces-33997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:05:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907432EEA51
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B69430405F4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B533859E1;
	Mon, 23 Mar 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oo3H8yPT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DBC38228F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256557; cv=none; b=moaOSE/ybGY6fQ82U2+SNOmRj2m8JmQF4vHybpzmRpUKAex7Zi9h6NPL2sE8KD04LHe0hD04rdbxp88YuZZFDQbYflGcRUSEEBY+OZKRsFR8J7h/WeGZ0wIQXU+2yT67JQ55gRyoG9gae38MX2ITD87A2A9mTRMluvGS9nM6O2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256557; c=relaxed/simple;
	bh=sNHUd0dgYZHbeTJ4zF/IZbJ7G4j074Qy84sj+eAWSFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFztlx5UAXmSu0PsyfvdpeG6CtB0RZRBe3LUvrqRsRO82Gz8ATuSOxrN4mCNj/qBmIkM7yCDEWxiU+EFauaAFSdDKYr34eW0a6xxWoXJkrPpdNv4bGv1QeE2EAgYxsR9BPP5WGXb6R3ReQcsrVJuGC7+VbG4fAN+lvZY00Y9AOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oo3H8yPT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B36C4AF0C
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256557;
	bh=sNHUd0dgYZHbeTJ4zF/IZbJ7G4j074Qy84sj+eAWSFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oo3H8yPTy0NuSyqL3st9CCsvedMPGdft50GdIp8JT4klEkj6o66DihGIRdSLvBM8T
	 H/BPM4AshQ/UbVPrfKhQNvsgtV0JrmOFE4OCvwttNeYn4ENvwBHaVbvleKx8YzIHA/
	 lewWnz7G/k4yMNJ7s/BfQBTphChWpqEs85XMDwClCtHfSgbWU5uVJxu+g0WE5IJcuo
	 qbTTwzi1ZWTLMUkMowkOU0HBU1fb56J6utZs8e96+zlM90zowvQ4x0nJZpr290f+7q
	 jnlBxeuQ4g2xgkfxXD7OhFbOTcHHegBJcXa0xnpY4falaeMU/bnOV/h80NVNVk4zqi
	 pxGgoOkSXBhyA==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64e9f79cae8so2931235d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 02:02:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWh9Mz/RMVVABt0EdtlFiLOpXyHNjcFFwWs9PKFna09gXEE2mNgvY4ek0NLaoRaD1KGNVuRHGxW2Ln5@vger.kernel.org
X-Gm-Message-State: AOJu0YzdbomvvSLJOwI4wPc3Yk6Sd+Q7IPGjDn2fErv6k9ym+vTYf9P4
	mryVN32CvhMBgBhzSqFlRErScP1fC0XMhXeXfe/G7kcFMCkuqbPi6UQcqgDLI+gDOAcC0/CXAeJ
	Uc94qObRbvJsxppDmYxPtGj8TanABYwE=
X-Received: by 2002:a53:e1a4:0:b0:649:f002:582b with SMTP id
 956f58d0204a3-64eaa683c99mr8644694d50.7.1774256556643; Mon, 23 Mar 2026
 02:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317115411.2154365-1-eleanor.lin@realtek.com> <20260317115411.2154365-9-eleanor.lin@realtek.com>
In-Reply-To: <20260317115411.2154365-9-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:02:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLkC2h+VWRLh=Rv03PbG8Lca1DuuAAs7Bish=OV7KZmiWg@mail.gmail.com>
X-Gm-Features: AQROBzBCpGWcw3Ira5gAjDFEnKBy5l--tJzRHpH9Xs-JDfdozczVjqRXrnvq1ZE
Message-ID: <CAD++jLkC2h+VWRLh=Rv03PbG8Lca1DuuAAs7Bish=OV7KZmiWg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] arm64: dts: realtek: Add pinctrl support for RTD1625
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33997-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,realtek.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 907432EEA51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:54=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> Add the pinctrl nodes for the Realtek RTD1625 SoC.
>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

