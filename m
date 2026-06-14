Return-Path: <linux-gpio+bounces-38417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oNZcJL8PL2qT7gQAu9opvQ
	(envelope-from <linux-gpio+bounces-38417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:31:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E36996822FE
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 22:31:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qhbf8LCE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38417-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38417-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93793300C5A4
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 20:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051463203B4;
	Sun, 14 Jun 2026 20:31:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586E27A10F
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 20:31:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469097; cv=none; b=uOvcJkik8U6FZ8Rnw6Z2eKMtGsXb2zqvC/IeVYUFmN6g5nbFzNbjR3PhVwEKBM6N91t3+rd0vViTQhWvH/Ikfya9OJN8LhSaDSimGJePsKe0ER0qjRFzUnYA/QCzB7lV33Jn1xIVNLaYto/YEaPkrLvuYxA3PfNryefLvzi1Ix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469097; c=relaxed/simple;
	bh=w1gV/a4hLgsRMDjpGdpYm0XIx5pw0Hjh7pY/3xaSsGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=malqGTE1fulfl4LskdanNFKZ8DFWXNH3m9Gte/az1EJG+h2Nf8OzIwuEPRycpv162xMiDV8N1cj891g2EmFHDuSYDQCI4X84TV0G3PYBY9jZRpqM7kFek85jeLZm9l1rtw8sLgGBfu7lE+8eNlS8u2Um4ehhET+DS7RUXLIbys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhbf8LCE; arc=none smtp.client-ip=209.85.221.180
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59ebb89109aso1810410e0c.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469096; x=1782073896; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZuVcnii6ci+Yt1LSi5CHR+55B3RGmLUfp3Gn9RgYgc=;
        b=qhbf8LCEPPwVWlBZRFDQeZaovvGl3oudWWwsUV20bvWqlOt7LKYYEum9+Qq6t0dPnR
         Yx8MqD712paXoeuFnimQuxIXyb1jhof/UtJ3U3LojvQeLwbL9p5dfrSF6SMdR61mOnqE
         GT9vaBkFI0+o1iFng4cx3mI0TjCRvkdeqb3vEXUUQpQrHw+xVOf7fr22ruuAoQ5JEo6k
         IOydAimuZaH0zeaCBLkXD0zUowJmbC3pC6aNGVFDGoMacUjPsWWFkVceVWTjJGfO8j2o
         WCPLYSO2sauEpu7CnqiBtMmOT0EZtNXfCitJCboCePsea8kskvBN8geppn8zMnO5j4B8
         3vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469096; x=1782073896;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZuVcnii6ci+Yt1LSi5CHR+55B3RGmLUfp3Gn9RgYgc=;
        b=Zj2BKCmeUdhaxn+T1spGP+Q7EyM2aZG4XJ+rJYcXhIqctiY/Arfv0VwPXp+Bvovt4U
         a/DkgpMoWikDH5JWiCzICx/f2HXjj7TvKcKhpLF01mblh8tg91wdYDw/WRGu4dkLc7G6
         PUAJZ5tIVbIIItci7mXhr3lY3KOrzQq3RUbZv/mZ5En86tD+Q2cBZByHghNXwYZevgXK
         5KYlQ2z/q3CYUCTjW+oXWMan+5V9KUPHpxPG1atwHCAkQ/w9Y/KoEgAc8WwMKcvVfw7b
         NPufERfy6hZYn81N3RVCDMC0uw9SvF5ixHZk3gXJ1Orzk32SXqCEb3imS4Hg8laYEGG5
         sV2w==
X-Forwarded-Encrypted: i=1; AFNElJ/Fmr7krapayW3D1hhQkVVvR3wbd1WDXFIYtzuq0ZL/sb6d0pcKwrMVaABDNt6asEMiu9HYjch04zA5@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJtCUTOV8DiKhmyjWdWTT+jhbRQUH0s7Gv6cD4ua040PE6NQp
	uGa+IT33KY0YQz1vQfsHVL1mw1YtGfT+8XkasNwDG4dc4C7Q02ZRMgRU
X-Gm-Gg: Acq92OF1n/WLXw50t0qvxgm/EDCC5iuUbf34M956/oDhajRpseww6XNyJae9fCnrgOr
	trj0o1MmLQCkT3zghubXz8MaQwSEkcu0XXoy7+zCT4xso30kS+VQb3gvkBog6GM2IQoC1QXNCq7
	4zYiQOZm44ZgJfVROWQOoqH9nghmjYaM4TPnxHUk21uM0l7UfZ8P66SOtsR5Eoa+8kOtLK+mbHQ
	HsvhQGExmY/wtw+TBofdqcUid5wxB99ug+X1+FLtfN66bJaUftpWMxyjfqUAKeFKtyR3fQF5sib
	2liL4+Jml8X2b41+KTCbBH9taSS7Ml+IX4E/dboRqmywnFghqMYuQJysjRqSzpjQItMk4ZOOP4e
	sQJhz1OBlnWCGwXbJxlgM959DzhakXZ1R//1WEU8MC4fael+mKdhGr2FBzZmTz1044CKur+YwjV
	rsvAO3sSZAOtjsCA==
X-Received: by 2002:a05:6122:2a4a:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5bb6bfdf85amr6517590e0c.4.1781469095733;
        Sun, 14 Jun 2026 13:31:35 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901f1d1esm2052674e0c.18.2026.06.14.13.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 13:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 15:31:33 -0500
Message-Id: <DJ9237FZUTWD.1KEOZLSW5AQYJ@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 4/5] iio: adc: ti-ads1262: Add calibration support
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-4-894c788d03ed@gmail.com>
 <20260613145055.06aedf2b@jic23-huawei>
In-Reply-To: <20260613145055.06aedf2b@jic23-huawei>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38417-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:jic23@kernel.org,m:kuurtb@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E36996822FE

On Sat Jun 13, 2026 at 8:50 AM -05, Jonathan Cameron wrote:
> On Fri, 12 Jun 2026 17:46:22 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add channel calibration support.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---

[...]

> Read it into a u8 [3] and use get_unaligned_le24()
> That avoids us having to think too much about the bits that aren't
> initialized and static analysis / compilers having to figure out
> they don't matter. I general it is easier to understand.

I didn't know there was a 24 bit version. I'll definitely use it.

>
>> +	if (ret)
>> +		return ret;
>> +	*val =3D sign_extend32(le32_to_cpu(lval), 23);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ads1262_write_calib(struct ads1262 *st, unsigned int reg, u3=
2 val)
>> +{
>> +	__le32 lval =3D cpu_to_le32(val);
>> +
>> +	/*
>> +	 * The calibration word is a signed 24 bit LSB-first value.
>> +	 */
>> +	return regmap_bulk_write(st->regmap, reg, &lval, 3);
>
> Similar with a u8 [3] for the '__le24' storage.
>
>> +}
>> +

--=20
Thanks,
 ~ Kurt

