Return-Path: <linux-gpio+bounces-31138-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGOkFiWLeGmqqwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31138-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:53:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3292205
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6E90306DFD3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF5033507A;
	Tue, 27 Jan 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7XMcba2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E43314DB
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507235; cv=none; b=Y4LWbf9WiNSID832S0F+4NwiqZ99BB9Kj32oO+vW93vwcsnycamX+z+KY7I0tcAjbz0vv3cMoI3YbaD3lH9yIUT+dy2gUEB5R9M3AByepo24nz2YV1UbA7dPWK+6Hn+/0bg0hMWG+cPSHvI99yQQI5a9uUUj/sK6/3CJgfJOCig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507235; c=relaxed/simple;
	bh=fudg96WDZCw+ZI63CcGtpWs4sCcWUk4nycBkSJzmxYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mH6evx5eFm01ZB+pItpjjyKbCsAjNOnIxFxecYDgBEKn7MUuG3sVGcrrY4qvyIcO0hw68t+3nxyrsylJveWosO01OVBo0pNlRuDrnQvz6AuHAG2y4OSPg3lx4D7MOZ/xMlrAsAYxz+lIZL+Hyh+kquq60WSESc+S0ucUvqr8+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7XMcba2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A015C19425
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507235;
	bh=fudg96WDZCw+ZI63CcGtpWs4sCcWUk4nycBkSJzmxYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c7XMcba2Kg/KveBJD0akBc6OdnW1L1CHaCd0ZhILNBeXYtwx1pVZn4ccDSIuNmBs4
	 WwpZjOKTxsLGQJlMRdEmQrSkiiPevtUFe2ATZHoobk3fZNITYcEffyXUm8/uIwtU0/
	 pQoEhnZOmxViy4+LmwyjjuLyiaEQoNI2KTFLss4dR0BZ6lEejnyDTwrFTkUnvnHv3I
	 GapgMUfwq1neIRRuRWEV4CcPcHprxPrFvTOHR4ok844dT6zJS9b5YbeYYCY4FKCiRO
	 2/Pve9FstyOiAYhtYXtUjjUwTCdrkzl0Sbc6XWBA5IB/FaNW4SVPhpQ5pzuYcmN1NY
	 RyQfKW26GjekA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6496804204cso2527562d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:47:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgwG5bqGQiKoa9Ne1p9ObJL0TZrwwR1lqEbA3J4iruFfCl5S1DEphg0/JDqJrK1sbD6yeMl5awvfNk@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPB5W0zVauz2hfRnPw8WItlF6sdtQF1/WaMkEv408g7EsTk4Q
	isMQnRJaYgqnuRE3XMYQ28NSF5n6g3zpRxCfy4RsQUtJDJYjBLO2Pv6qUMkPxHfyyaZT5WCYy7B
	J0ccrKxcEKLPliQElu/c9fg/l5YBYLG8=
X-Received: by 2002:a05:690e:4086:b0:644:39d9:8c39 with SMTP id
 956f58d0204a3-6498fc76f9amr642233d50.84.1769507234456; Tue, 27 Jan 2026
 01:47:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
 <20260125195123.248798-1-jie.i.li@nokia.com> <20260125195123.248798-3-jie.i.li@nokia.com>
In-Reply-To: <20260125195123.248798-3-jie.i.li@nokia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:47:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
X-Gm-Features: AZwV_QhY2MoGt4mqLsrOAnDMGxLpO56qiQ7hfX1OXkwRWUqmCqd4NEkCrXgZMk0
Message-ID: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: core: support recovery for single-ended GPIOs
To: Jie Li <lj29312931@gmail.com>
Cc: wsa@kernel.org, linus.walleij@linaro.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jie Li <jie.i.li@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31138-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nokia.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73C3292205
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 8:51=E2=80=AFPM Jie Li <lj29312931@gmail.com> wrote=
:

> Currently, i2c_init_recovery() only assigns the set_sda/set_scl
> hooks if gpiod_get_direction() returns 0 (output).
>
> This logic fails on certain SoC controllers where open-drain lines
> in a high-impedance state are physically reported as inputs. This
> leads to a "deadlock" where the I2C core refuses to assign the
> recovery hooks because it incorrectly assumes the pins are
> input-only, even though they are fully capable of driving the bus
> low for recovery.
>
> Update the recovery initialization to use the new
> gpiod_is_single_ended() helper. If a GPIO is configured as
> open-drain or open-source in the firmware, it is safe to assume
> it can be used for bus recovery, even if the current hardware
> direction is reported as input.
>
> Signed-off-by: Jie Li <jie.i.li@nokia.com>

This looks good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

