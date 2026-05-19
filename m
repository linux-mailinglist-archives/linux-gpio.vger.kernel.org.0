Return-Path: <linux-gpio+bounces-37093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLuTD+2zC2q2LAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:50:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB22575BFE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3EF13014125
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D48261B9B;
	Tue, 19 May 2026 00:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AtSx4k1S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637EC26A08F
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151840; cv=none; b=kBS+eCsRjOYUs5mg4BAEnqa/5I82QYtGAvb6wCmfYbY0n/T17nBluOQ4/l+Q58GwR02lur+XBpWc1YgTtlIO78AChzip0dABjBRhGqObNpjYY2BEc17bGUhxlt/Hc8cLTWu6z532oAFQOC8P1w/8Z8wmne3rr98CS4Cecna7guw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151840; c=relaxed/simple;
	bh=PnOorzYYabHeSc3XxBftXhuC64icwN+rEkBLBJ5Sddw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=eq5E9W8mekENs32uSCesfR4fH2C60HWGRBhl8P48RxvOjPUz/izqQ3xolSZFLUah60uBg9moPuo5IPoiGw+z8Mt6PaoQTUxIfw51zloUQNPUbb65QUVtWf6RHC7slU2mU634w4jtLJhQGV7KiIx5Ee4KiRiE2kufk0zamc9aYoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AtSx4k1S; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f3c623322bso9321063eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151836; x=1779756636; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tXl/22rkVvhZ4nUM4MbQlEreFWYdxVzxn1gtAZs1eA=;
        b=AtSx4k1S/w4HtbRht68BANm4Se3ny9ye+1bDz738CYbmowcNhTd+eawQPKsji13bh2
         Q1HiGT7EDb5DgWh8o76LC3JfPOkp4fk9e9S4ThVoz63Cm+ZFrzlTJ/XVu0gOlXO8gfzP
         TtwYD8skqLMq23vqI3ljKLyiljdlR9hePg4QNyFxP0iHqyFVDQZwDOd+xe0BLbpv6tvq
         O9pViAtqamwce0nE8h955nImgrk4D8qjY/t7gkkvd3Q0PoJPH5/Kru+zSNYUPCU5JFqc
         ojySzmukTH8rxRW6A3VLJRiQbTfSOR0HnyAKcM1D79QcH7SttJx+lJcoVi58jO1nwQsL
         y/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151836; x=1779756636;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tXl/22rkVvhZ4nUM4MbQlEreFWYdxVzxn1gtAZs1eA=;
        b=rlwFaTsRAqk7/n8jNLdmHXpTuXMp+oHjGqTex1no1t4p1N5boII/VEDRo/zFqAK5qT
         P4bp3q7SzbjT/r1aSGZGN3fHN1uDVbZwpaKMJG0G3Hv0KesBFryZ+I5qrCiXt3c1zTQ1
         P4fL2RC4FLE3XjTYKDCLXj5Tqy6BDEDFMDOMrvU554zvA//DH4quTY2vghR76VOS7rGa
         1GsHf4fOq9SmUQf9NGDRFEDlTf+bCGdmfcet2v36tvat2SNsjO9sKHcBdw7f//kB6Q+T
         NTRRCnfvJvd3gdQ5DVhLh6pf2sXgsaNhZB6+i3eJ0WFapICi55dYLRlu4tkAyfvcMMbC
         vDGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+moaaB7MpQlzzzuW65RsQIBaTryqX95Q7M+GyBzyoRYCm1jS8FS3zdfkpPb44U8vJsYkCtBF6oBKW@vger.kernel.org
X-Gm-Message-State: AOJu0YyVi/OmKn8R2rP6yE90WnXaRH3bbmd7Z0srRN/nch83stOWIFNb
	XOq9CRDG21Pox2sPv8gWKRlNravw+Q/5tCO9+SiCZVhVNZK39m3nMS7DmFxUCXiM1Pg=
X-Gm-Gg: Acq92OHKcpihDhgA9hxh2zj/n1nw1bFJwwSfBc3ZpnY16v4P5tVN2DewuNTtiA0ukE7
	2wHgg8bI9VKDfWbxLivLbjeHQDDoDWsKbLEygvjKK9pwit8ipkWEXvF7Ft8dqaTOC30HjHo09Rx
	kBDBfSM4dyT+E6C/8sYeJORkuyb7uh3/iZAUr1bUTK/LFqpyRq2CtLazbiWkBLQC9Zi7n8Wsqj0
	ebauCDDk1cZJNRPjN23YCCm7SfHijjHR32uW65F/0JzVMNrS2Q0elh7L7JvxPoWeuUPeoS6bx8U
	VVIs8o95OBBf4/LbO8OzjJP1ElsvWnpsnKJ1EjVEWIKXWRE3puzVriA+OJHH/GkWUCwQuO/X3yx
	nINa2Z0rc3d6vFg0+CvjFfMUSP1lMH4rFRXL69VOBsAHCNxmMmcjUpQK9ZBVzXJjlQJQskgA0OD
	SHsoPexUw8plRWQjNLBFqEfo4=
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id 5a478bee46e88-303986b7f00mr8980852eec.34.1779151835662;
        Mon, 18 May 2026 17:50:35 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afe8dsm15256199eec.27.2026.05.18.17.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 17:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 17:50:34 -0700
Message-Id: <DIM8OTDD82P1.V7SRZ5IA5CDL@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Alexandru Tachici"
 <alexandru.tachici@analog.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 0/5] hwmon: (pmbus/adm1266) GPIO accessor fixes
X-Mailer: aerc 0.21.0
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
 <6ec6270c-595e-49b2-8465-31b5019de87c@roeck-us.net>
In-Reply-To: <6ec6270c-595e-49b2-8465-31b5019de87c@roeck-us.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37093-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ABB22575BFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon May 18, 2026 at 3:08 PM PDT, Guenter Roeck wrote:
> Hi,
>
> On 5/16/26 16:18, Abdurrahman Hussain wrote:
>> Five pre-existing bugs in the adm1266 GPIO path that all landed when
>> GPIO support was first added (commit d98dfad35c38).  Each is
>> reachable any time userspace queries an ADM1266 GPIO/PDIO line via
>> the gpiolib char-dev or sysfs interfaces, or reads
>> debugfs/gpio-<chip>.
>>=20
>> Patch 1 caps the PDIO scan loop in adm1266_gpio_get_multiple() at
>> ADM1266_PDIO_NR (16) instead of ADM1266_PDIO_STATUS (0xE9 =3D 233, a
>> PMBus command code that ended up in the bound by mistake).  As
>> written, the scan walks find_next_bit() up to bit 242 across a
>> 25-bit caller mask, reading out of bounds and -- if any of that
>> incidental memory contains a set bit -- driving a corresponding
>> out-of-bounds write to the caller's bits array.
>>=20
>> Patch 2 drops a redundant "*bits =3D 0" reset that sits between the
>> GPIO and PDIO halves of adm1266_gpio_get_multiple().  As written,
>> the GPIO bits the first loop populates are immediately discarded
>> before the PDIO loop runs, so any caller asking for a mix of GPIO
>> and PDIO lines sees the GPIO half always reported as 0.
>>=20
>> Patch 3 adds the missing "ret < 2" length check after the three
>> i2c_smbus_read_block_data() calls in adm1266_gpio_get() and
>> adm1266_gpio_get_multiple().  A device returning a 0- or 1-byte
>> response would otherwise compose pin status from uninitialised
>> stack memory and leak it to userspace via gpiolib.
>>=20
>> Patch 4 moves adm1266_config_gpio() past pmbus_do_probe() in
>> adm1266_probe() so the gpio_chip isn't registered (and reachable
>> from userspace) until the PMBus state the GPIO accessors depend
>> on is initialised.  This is a prerequisite for patch 5.
>>=20
>> Patch 5 takes pmbus_lock at the top of adm1266_gpio_get(),
>> adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
>> GPIO PMBus reads can't land between a PAGE write and the paged
>> read pmbus_core does in another thread.
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> Sashiko reported a number of additional problems. As far as I can
> see those are real. Would you mind fixing those issues as well
> as part of this series ?
>
> Thanks,
> Guenter

Sure -- v3 (sending shortly) folds in everything Sashiko flagged on
v2 that isn't already covered by the "buffer-bound and timestamp
fixes" series you applied to hwmon-next:

  - New patch 5: register the nvmem device after pmbus_do_probe();
    same probe-ordering hazard v2 patch 4 fixed for the gpio_chip.
  - New patch 7: take pmbus_lock in adm1266_nvmem_read().
  - New patch 8: take pmbus_lock in adm1266_state_read().
  - Patch 1 commit-message wording fix (Sashiko corrected the
    "27 unsigned-long words" arithmetic; no code change).
  - Reviewed-by tags from Linus Walleij (patches 1, 2) and
    Bartosz Golaszewski (the rest).

Thanks,
Abdurrahman

