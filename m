Return-Path: <linux-gpio+bounces-39594-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HvF+FCYjTWquvgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39594-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 18:02:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E928D71D9D6
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 18:02:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Q0wd2pN5;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39594-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39594-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21FD13037177
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 15:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED52430CEA;
	Tue,  7 Jul 2026 15:55:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A57175A89
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 15:55:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439731; cv=pass; b=gbUEXjSzQs0eNUpjMatYa75vc1sgSp7ABwJsxHcCf94+Ai2wwJNd/cKDROt7b6EnKWx8XLSVnWUwz5JKXhR7H61VQSHBRnGzm2JSMJlJqgwIXNG9JweLk9x4q7XkgglRuERWOau0xT+dLExjBqfI1ZylacthKvj+imTVOsaIUgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439731; c=relaxed/simple;
	bh=BXtCYTAuL/YDDp2VwXSxIIpyXFl2f8mheVzsVKldQsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFK31lJP9r0UXWxN8DVg3sLGiq1QGHGB2+X0YFi/vKYkaW5mFPB6mHYlsLn+hhPX+qnpHU8ZL5qMXNW/DfBT/Db7aYXz4JADLy39i04VtVaWzbazrJwV/RmKXicyMs56ndKmQGhHMlxFiLMZ3GNbZfftjodBJ2/JkXkgz9Ad45k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0wd2pN5; arc=pass smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47362928f65so4139797f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 08:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783439729; cv=none;
        d=google.com; s=arc-20260327;
        b=E7CvaJULUDCoNbyPMXJEYgEyRREhv4INFqd4MLii8Oo8mKgcb1nYqMKBDKDXb/4Gzh
         Ti+EqTGn3d92/KQPn4IDH4exzoH0TU1FkHb2f9YmT1W7aTXRD/k+yqAQHaiyC4W4tRSJ
         +8ocefLr1Uvlc2H/ETyc6+TvJ3K8EFSQr7Ht5iG8E82bCGfT5Sr++ooyRzyV1otuBEUZ
         DzJuFjW1S9KtLSq3XfVdCaPMVnVh7PRLlrYW/pcbMTiOa3CqBxbJD5fQ5S8/qBRDU2Bm
         zyWlXptYgMtLyq0CsyU6VTq5v9UkGVTppi522vf+9sF4FNFcSegmmg1+ejA863h0FBw6
         rvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BXtCYTAuL/YDDp2VwXSxIIpyXFl2f8mheVzsVKldQsc=;
        fh=5YZ9snvihxAU6Ove5YLjV/0+3l2DnW7JNnkLUn/vUUE=;
        b=ErJYgViuCG3YaVpr64Fib2nWKup9TnCzYnKznOZ6xBVGiJocjGZuoSaANgBXG5DW6a
         lIbGHCjM6Vh9VU2yWMX94KexMLqYGo8av6eVWYRWKKyXiQoRUM/bng95OrIrw2mAL3cJ
         0SGj29hSAK+t5CBF3H0jmUZC++NTgeXN3+i4v9pd1Fbq0cDDHrp8NoyerMhlxHVGiT2y
         rT6tdaTwS5VcPqm2dgbtUogSYS9K/itID5hD5VVVzVXoY+ue60rxUgmtgYw3qUyTDB9d
         ur7WK1P+W605XTJqpggKgItH39DYlAhlLwwPWX01PRJA7fobT3clcHD1xCc6pTFFHyER
         I3AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783439729; x=1784044529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BXtCYTAuL/YDDp2VwXSxIIpyXFl2f8mheVzsVKldQsc=;
        b=Q0wd2pN5GdwFzCodBh3Io5xL2T2VeC2ZnGKUq5W0YclRndUuBLmz+dm/kUDS7+8+rm
         n4zeb62KTGlKwO6p+EuBRB7iuRk5pZ87R/cqNTO/6QIzPDeET3JJMN2T4JZlatVv/brW
         2dPziogjAO+xFrxTinnvMzq+KcZPz+y2fV2wBNjpHjXHGgLOmvI1rtQ8N+w2N1elNaNa
         WPLSdWMGDgJXLaysPXRKM/nPEodwAMmO0kWBdK4ccLse065ceeAro/hAp5NtOchMJKmk
         OWHxks2udszR0eHiyjWkRfpW19NjgTxjEjSJRAr66ltFrMRyUt0gu6AlA2VJ+3qBrsIQ
         79MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783439729; x=1784044529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BXtCYTAuL/YDDp2VwXSxIIpyXFl2f8mheVzsVKldQsc=;
        b=qhCZyw6kz8L1gZ+tAXA9Q6SEPDr/8NGUbXirQbYzqvQGApm5nZY1yT+hzuTcxdMxJk
         oH/83f8YzAxSGpFV9VLm5LNIS6wLyy2tw7jnikGMgrpRF3DiZuWFk3az7a4wBIlNTNDR
         53ZX0Dq8hD2/TEkxBw0QsDXkNCBT65qPnISKqScbRMlM95qiTcj90g8i2dR0H9W2O9oj
         QqM3jQw48EWIRVDPNsrBsGheiDmQ2gclh/u2LTInLLTfSzuOC4YYyQbJDC2oblkmKVVQ
         3q/7e0bul8np+LDuOHhRVzP+zj1ezUcKYRC66dbl7b2bqI4yetIJjmAYOOzYEhGwYskf
         j3Dg==
X-Forwarded-Encrypted: i=1; AHgh+RpxVBGDvFqzKEsgJwJOO6GZ4MAI4rqquCcpV8X9YD8KdYNJdvs9e2CYcIhTnqe8ivGx6LGvvCmMLbUz@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFHrFooHicN5jn5R25Lhh29jyJQ36hqNFmpyzm0hoqcpKG9Ia
	nXmtewhMit0l9QqeWyXchrFdowowzH+e00Hp/24ckvf79lQAlZzvdrKhtRtFhge53899oIsSVvN
	QpvUyCj447SfVpmGYpCyMIo8VzCTSlIU=
X-Gm-Gg: AfdE7cmKF9V3xb9ilikhktX3KiD7+j1Rd5zE58c4XpdyakSlq/H7XG/KSWhBZtKySqp
	IMtvlSRNWWG12ufo5iffFoDNWAZK6N2KVeFFt3K34EDKZwvi1o7mSrNHHAwbKcxeaas5OQux9od
	/AsTUpuRZdnbD7kRpL+Dj57Kvuw4DQuPp7As5lGMCydjEd8FQr0htjVXvjdRcSfFGbBvz10Hw20
	In+j42fF2eNXnoF8boFxGWQt5GmJLHbalZR/+7jjejYP8yQQ3lKOTumLoYd3Gbm4/GV2ggttys4
	xo3oMfZDZw==
X-Received: by 2002:a5d:5888:0:b0:47d:ea8a:d211 with SMTP id
 ffacd0b85a97d-47dea8ad35amr4134625f8f.29.1783439728649; Tue, 07 Jul 2026
 08:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
 <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
In-Reply-To: <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
From: GaryWang <is0124@gmail.com>
Date: Tue, 7 Jul 2026 23:55:16 +0800
X-Gm-Features: AVVi8Cck0qeqXuSODnHYI8ezXDcQ9lflRZDe585Rf98WqdIsCjEcVxZJtOb0g9o
Message-ID: <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-39594-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.richard@bootlin.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E928D71D9D6

On Tue, Jul 7, 2026 at 7:50=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Hello Gary,
>
> On 7/6/26 12:36 PM, Gary Wang wrote:
> > Add support "UP Xtreme i12" and I2C/PWM/UART/SPI pins mapping data.
>
> Driver probes successfully on UP Xtreme i12.
>
> I tested the IOs:
> - pwm0 does not work.
you have to use our pwm kernel module for pwm test, I'll provide later.
> - uart1 partially works: TX is okay, but loopback doesn't work. Signal
> is bad when I add a loopback. Looks like pinctrl misconfig on SoC side.
uart1 tested ok on our side, if you loop TX/RX do not forget to turn off
hardware flow control. and we have executed cmd as below to make sure
direction is set all right.
echo "uart1_grp uart1" >
/sys/kernel/debug/pinctrl/upboard-pinctrl/pinmux-select
> - i2c busses are okay.
> - for SPI, MOSI and CLK are okay, but not CS.
Do you have enabled spi in BIOS HAT configuration?
CS0 should be ok, it's SOC defined, CS1 is optional, users can activate low=
 by
himself before read/write, actually all gpio can be manually used as CS pin=
.
> - all GPIOs are okay.
>
> Could you have a look please.
>
> Best Regards,
> Thomas
>

