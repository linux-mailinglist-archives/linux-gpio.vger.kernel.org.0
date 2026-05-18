Return-Path: <linux-gpio+bounces-37038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBOLHrfYCmrb8gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:15:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0F5697B0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22BB303C3E3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF713E3DB6;
	Mon, 18 May 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTVZXc+g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212633101D4
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095339; cv=none; b=DOPfBP8aIwcjnPRIKXaz3u+EV40rLhzcB/Cn3lWXNcpkZOSHJujPwK/5R8TtnqLhzhobiAH8aP2N0dEKUSCefj9/R/nCIKcssS949cKyePnlhiYR3VexbdwMBSpP1Udcnr/48c9ej62rFuTyPo1EHIgpstiRAKsdurTsxivKguw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095339; c=relaxed/simple;
	bh=YnbQADgWw4IQd99TL1cCUGSxWNTcIBiIuwe+4uWsrgA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qH0jfgiy2ooHwiVEwIeKipcpYMlYjR1zY6QG6jU13ztVA5TzaATbfiSjbsPeftIkcPi1WPFaujuv/3U1jGeO6sWQ5+H8Gy0M6yciB2vLd4mX/zGA7i1ezsW0oCgZlrPnUT4SJ+1C7LMzTkmjs2QyhHSRbuwUY+LnRhbVc2AEnlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTVZXc+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB11FC2BCB7
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779095338;
	bh=YnbQADgWw4IQd99TL1cCUGSxWNTcIBiIuwe+4uWsrgA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=XTVZXc+gUAnDhqmz+JI6igCAP2gIc6+8uSPoGlILC2yFuxWvNHZxKdDoeJLQWn/Dw
	 boN2H5l1JdCbFQBk9bC4L1zTQZaO0y0rvm/+eFQMJO/DPz2903V40+X/zmXHLUI1+X
	 CnlnYsW4Ubn+AgYOx4EJdbk/tQlgW8wGu/o8AkNcRCcLIogyYSCtfaxlxjBim++CMy
	 jPHzPa477HenIlPr1n02v6FNZdkZlOTNQiFFGt4bw8+kNaWT9+7poswyO8Qgow0Skg
	 REw8Jzj2mb61NBtPv7gwrnQFR6tgXbEy3ubBjlmVxCwIFpCcam2MNnO/PH39JbN0oI
	 2GmDhLfCNvWbQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393d6025f99so28971621fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fe6q1/DrqDtIlJ5ANdNcX+zrlt+/zCYbqDZYSsl3m/252T0vUY+ih5nSqsA/tWU87pLOwN6+Iiwp4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ndSZMhr6IWbEiBp088tsJG/VC447YLwDQOAzZeDC4Fo3CsyB
	sMgjaFaYr2wysPpUpsKMWlb+qLlN7rgJu/t1VpfCWYEOzrNYhDBt268q5vjTNpFFGa1kUrPJQWC
	l/0pJr2RcL4+YAZBTMJmL2aAxN50CfqUXZMyrxQIpDQ==
X-Received: by 2002:a05:6512:2301:b0:5a4:d0d:84e9 with SMTP id
 2adb3069b0e04-5a8ffc3dce5mr5141862e87.4.1779095337458; Mon, 18 May 2026
 02:08:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 05:08:56 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 05:08:56 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
Date: Mon, 18 May 2026 05:08:56 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md_kjwH5v1JkQz5DxnzhK9yk1t+kjNcHG7P75bdg_16xA@mail.gmail.com>
X-Gm-Features: AVHnY4JrVPNxA1mweXYiG-jAyfspnD_e2PKGNQOQJaiNP977WegN9bOtVULGtxU
Message-ID: <CAMRc=Md_kjwH5v1JkQz5DxnzhK9yk1t+kjNcHG7P75bdg_16xA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hwmon: (pmbus/adm1266) GPIO accessor fixes
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Alexandru Tachici <alexandru.tachici@analog.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D0C0F5697B0
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
	TAGGED_FROM(0.00)[bounces-37038-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nexthop.ai:email,mail.gmail.com:mid,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, 17 May 2026 01:18:46 +0200, Abdurrahman Hussain
<abdurrahman@nexthop.ai> said:
> Five pre-existing bugs in the adm1266 GPIO path that all landed when
> GPIO support was first added (commit d98dfad35c38).  Each is
> reachable any time userspace queries an ADM1266 GPIO/PDIO line via
> the gpiolib char-dev or sysfs interfaces, or reads
> debugfs/gpio-<chip>.
>
> Patch 1 caps the PDIO scan loop in adm1266_gpio_get_multiple() at
> ADM1266_PDIO_NR (16) instead of ADM1266_PDIO_STATUS (0xE9 = 233, a
> PMBus command code that ended up in the bound by mistake).  As
> written, the scan walks find_next_bit() up to bit 242 across a
> 25-bit caller mask, reading out of bounds and -- if any of that
> incidental memory contains a set bit -- driving a corresponding
> out-of-bounds write to the caller's bits array.
>
> Patch 2 drops a redundant "*bits = 0" reset that sits between the
> GPIO and PDIO halves of adm1266_gpio_get_multiple().  As written,
> the GPIO bits the first loop populates are immediately discarded
> before the PDIO loop runs, so any caller asking for a mix of GPIO
> and PDIO lines sees the GPIO half always reported as 0.
>
> Patch 3 adds the missing "ret < 2" length check after the three
> i2c_smbus_read_block_data() calls in adm1266_gpio_get() and
> adm1266_gpio_get_multiple().  A device returning a 0- or 1-byte
> response would otherwise compose pin status from uninitialised
> stack memory and leak it to userspace via gpiolib.
>
> Patch 4 moves adm1266_config_gpio() past pmbus_do_probe() in
> adm1266_probe() so the gpio_chip isn't registered (and reachable
> from userspace) until the PMBus state the GPIO accessors depend
> on is initialised.  This is a prerequisite for patch 5.
>
> Patch 5 takes pmbus_lock at the top of adm1266_gpio_get(),
> adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
> GPIO PMBus reads can't land between a PAGE write and the paged
> read pmbus_core does in another thread.
>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---

All these make sense to me.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

