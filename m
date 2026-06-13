Return-Path: <linux-gpio+bounces-38399-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l++PDHz3LGrBYAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38399-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 08:23:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D267DD79
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 08:23:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=juhxLx5J;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38399-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38399-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02CC33116B5C
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 06:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230383C7E15;
	Sat, 13 Jun 2026 06:23:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FC33E346
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jun 2026 06:23:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781331815; cv=none; b=jNFnR2gXt46hEnTdYZ0qbkQD7C/SlnC+srwhOelyQPeP0PIjCo7CbOqaoBkayArquKUj/CBK6Nsevc+GICDSf6fkvPi5nTlEHo05mt4L9h2PMcXHAR9pVVx8U7HJcfRWLaPBJXRIFV8Oheg4V2lFNjCVLRcPtFJXPGATclmkLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781331815; c=relaxed/simple;
	bh=k5G02N1zKzfIjIVmFuEqHkT8drwuzrUmLQ3UCGPXm5Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=hlyhI2tDK4+ROFWrw71aBrGuDRSQNLcmoMyXmD01U798pQ6M2mOarJjSmQ3SRZape8VroKRflg+hVCKqvltN88eIqkcNGJwXLad/Al407ZhrnHw1CH3m2RIKSQtvSm8rzt3LsOOsx5YcKWvsxdVulBv8z4N5S1nGa+4r/BZHsFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juhxLx5J; arc=none smtp.client-ip=209.85.221.182
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso696893e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 23:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781331813; x=1781936613; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5G02N1zKzfIjIVmFuEqHkT8drwuzrUmLQ3UCGPXm5Q=;
        b=juhxLx5J8zYDQcGQreyFHgYc+i/xO8M3b2cPSJc7ti9UKUMcRkX9fGd3wBv0IpQcn3
         WBUbydMX7l+mfx3vu3ddEurmOBnnKlw5JBoytQ22R+TbeHyvGjqstggTDheRAvXIdRKn
         aeCdHXFoyQ1bicb8Kpu98Kr+ro/toay8eGIZoKu+kiSLJPqa2RIEAWUgnnO2Vj9x1Xpb
         cKUZ0LMPI4VAB+yR/wWJ72mFakNW9iQ/zzkjdUlSSrKjowX5pkbURX0Hbn8bCcHAc8zW
         n5MJYyUIfI6AHSHXK+ZWWRS4BE3xbUu5+YZbYWtVjX5ilSjTvmMtty83u8H1kAmlA7NX
         A8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781331813; x=1781936613;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5G02N1zKzfIjIVmFuEqHkT8drwuzrUmLQ3UCGPXm5Q=;
        b=GIElsp97Z7ESO9d2GzXg9o0MoyMVp6vJrtMbJjNMVAtlx2pQaPBGRqkI+c8flcmckN
         k8/91zdtqFvgz1BU9woIFQ14ShM61N8LvX+n4x2sgGtt73alNQ0x/ls7sAT0E7AiNRVW
         AMicU48XJiMuXftB2av/HcM4Irfl8/iyeVGnz2W9o0Ct5DeFU+G14PPfkZfFwfzbb2+3
         maukV0TiabyuYFrDjPq0qvU32rmZKYy8gBpdmx+R9gwBYuODqxCagbL/RaDgJKqrSmVj
         KWHdtbC2OIX4WQhDGa8ngpukQFAEev43lCBoaV74VWHopECrHB4fSBEQSCmRH27Q5M/2
         JCzw==
X-Forwarded-Encrypted: i=1; AFNElJ+HVvRVp0naDQplTLetkCrQCXNbWmIPezH1MkfKwXjUMTxFjPqh/JxESpPTe/Mb6c17Jaf8viz4PR72@vger.kernel.org
X-Gm-Message-State: AOJu0YzAptIjSVKdZEr23lMoHYqdVqPbHJuVZmWNuncsBiXi3QdXORBQ
	6JuDo4db7/1dmBB0xd3R5YKJDd8DMBSLHCd+XqAJZlRPeAzvSpj9oS87
X-Gm-Gg: Acq92OECQcA6EmiYF015JSp2fhaTOpKFuLG4m9S73eQz9zKAYm9fI0TuZVahfsxFou/
	s0KcU8lcJBTdXaKpQU5gslaeDoJoT1gpdW6Nct0NOcNUtfP6wSEsxi2n5+l611cRWMhdsU204oD
	BZWGF9AX5eZYJ+/rlj8x8SrYsUCAAy33rDf4m9Rsbr+c159FrwBYcGIoRdI9tFahBsKs+2ORvSx
	gyxsCvPHCKfeVI2gpQ5EEVEeT7SUxyMus5Gywv/DXMDlYE++ZkhJikYvbZiP75z2CPE6H6kdbJq
	EvKY9Xn2jonbp5FIimyeoIVJ1LkUwZWdQVPVwSd/FGn5qBVKC1iHMRD5hms9HHx5S1vdvTgqkmG
	K2cb/Akff3wcwVNPhm0ZV58MDFJa++7C1XcCh27ydCc5wysSA4wDZsLcwxT44qp+bAVbkqXUAnd
	b1nEEmYppQgHiQAs3QC9dPFHU4
X-Received: by 2002:a05:6122:32c3:b0:5a4:b5ab:b5f8 with SMTP id 71dfb90a1353d-5bb6bfa4474mr3583733e0c.2.1781331813101;
        Fri, 12 Jun 2026 23:23:33 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691bc485sm5244018e0c.12.2026.06.12.23.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 23:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Jun 2026 01:23:25 -0500
Message-Id: <DJ7PFABQGQ5X.Q9W1BXLAQXGP@gmail.com>
To: "Kurt Borja" <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 3/5] iio: adc: ti-ads1262: Add GPIO controller support
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-3-894c788d03ed@gmail.com>
In-Reply-To: <20260612-ads126x-v1-3-894c788d03ed@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38399-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 849D267DD79

On Fri Jun 12, 2026 at 5:46 PM -05, Kurt Borja wrote:
> Add support for the GPIO controller capability found in both TI ADS1262
> and ADS1263 ADCs.
>
> Eight analog input pins can be programmed as GPIO. This configuration
> does not prevent the pins from being used as analog inputs at the same
> time, so no considerations were taken in that regard.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

After going through Sashiko's feedback I realized this patch wasn't
properly tested and the gpiochip callbacks were carelessly implemented.

I'll do better for the next version and I apologize in advance for the
time lost.

--=20
Thanks,
 ~ Kurt

