Return-Path: <linux-gpio+bounces-34421-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DtmM01Cymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34421-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:28:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 773AE35831B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B7F0302834B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708483B3886;
	Mon, 30 Mar 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6iLvl9L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D313AEF2E
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862698; cv=none; b=Vm0dItH/06dQ2oUDOG8CgsnAnR9LSP43voH8MB0oVMC79CTwd2Sc65eM+PuLTuRITMxAd2PMR6bxTdKpQVC7EM9zk/1USVcbN3ZtGCGvZkNigWAuYJ/QpMXxCO6pwJQ7VdPxInAtqDhVHVSgHGBy7tSCV6cyOhqzmpiyGN0r70Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862698; c=relaxed/simple;
	bh=8cg+3kQLXXiTkfV3cU9A/x5nfqzAT5cAj6P84d3VV1U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VfziOmL4poyQd+3/Q5upU4kPuPvS+291rvP6ZCCnSXQ+kCpQh3iMIUcH4rFrOQWZaHYxloP3l6Hd8RMNah6+ZbBuKp7z7OwrkzJ7wu1u0leQHywy+T3LKUlortr6a2eDP7fJoa0vA1d++dfLUBxbaGf/OVuZsBbNK9qYGDW7iQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6iLvl9L; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4533049eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862696; x=1775467496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GpOZsFA9YDn0yRQpDJcAiVM07QWQzHxZa1ILteDRZbc=;
        b=k6iLvl9LPz2/w133TEPEysXJG3Aivszk2lZUaY2EAq03nLl3CGtcPNZPbWGrDkaiEJ
         6vvX4MMCjI0iVIipmBnvrrVqJwkB7XOgC8TaSpzOqqErMAtdb59Dy7KqnmW/RHRWJRU8
         ShuH5dk5k9pYjQVGQt5aU3VE4TNgzB+DTWs26i3c5SIxZvmGl6PXYQDpNSjXHcq4pgu4
         vTMkUVbWY5slW5aJKI2C+Lw0T74JrOmdQo24aVFSRiwUpjmYZUgCwKq1PSNta621V2ak
         2OrIkDDzufPs/tGdFpx2sORlj9xhG/jjXi2wUVRTGeAmyUH8LA7qHlE+Bs1EMDIRfy/N
         JYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862696; x=1775467496;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpOZsFA9YDn0yRQpDJcAiVM07QWQzHxZa1ILteDRZbc=;
        b=OcBLxc7tcsfqb2rqhMz3Nin6E44OReA3KmAOkPbDgQK/HWKY2i/M4C6U9IP+4mYgaw
         FtL+NpoZH0Vd9AxjAdCQNWgDzSNcSbk1lfbaXw1RdjYD+SZUlmhUrYO6j9WkQJLupmLv
         r6BYvPMUljieef5a35EOrvNuwyB2SvZqBZGViRkqoqjgoLz4enP+ZrpAEZmLcWeuqn+V
         aBmyVauItg0YE1qJiLvI+U3B3/XePnW64L0iAbBEojZjkN+ZU4nMYDlNVr4QgEJzgaWH
         mOqRjfmaTpRs1JnfSDouzNi1jEF+jH/Ll4WQGp9+uFja5uRgoqpclu1bIdZMnhs5bj16
         aM6g==
X-Forwarded-Encrypted: i=1; AJvYcCVbGj42IXRV2fCnhn7esUsansjPgpzluR0iD+M013zHTdZAxACVOJZNg/wgasvu3UmXHz3QynJHpBZb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxza0rEI5CsjGW9kWEB6GdaMQtVwPrDCkvVqHp7xTkIGHfe0iwE
	zga/8Xl25uLeT0y+Nz5CazQ6Xt9mERRBsocn07ejrgEWl7F6XU0SZObW
X-Gm-Gg: ATEYQzx5tjz/aFbME9GPRnQSsGvNUVmKa95iQinZ7eTbl1Otsx18XpPq1XIF0GMUwEq
	nhfZoe5xRABfHi9CC9kj46VzqbFqMQ6fRUEBk0m2wKLo/OOCA7tlry8r2wYIrPnvuhmrARJmTny
	HfACqJQdoN1/CC0aHBxOMDhDh3fA6u0Aua3C5xtSN6Tt6HM/GIWHtaHaSz/m1iq6S2gaFXy7UI5
	dhjNbTS/D49RwynclZthZ9/n9YvThv2ChswRpMc4uAhhLA+81XTNsV5FEaxo5bloN+ZI4yQryqv
	8Qnm9ZhaZZ6OMnFGl5grHbb+b/hctuoQ7POKs2j+9An9jN7MJMlhFRUvTxrXJwVZJFMYeecEmIb
	rTIU8nbOed6D1awXazVmH9qd7Oi1Gnu7Aq4U1uxW3OlPZ/7tTGEjZKiAXANSNQBP7umhyip22N4
	tdDXmubWCVSnY2f97db0/3+5r/zKtcZ3IWLSoebnEuabE=
X-Received: by 2002:a05:7301:da0b:b0:2c3:b172:83c2 with SMTP id 5a478bee46e88-2c3b1728c62mr3307373eec.20.1774862696044;
        Mon, 30 Mar 2026 02:24:56 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2601:647:5e00:4acd:e6a1:71c0:d327:1ab4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2ff2sm6740116eec.18.2026.03.30.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:24:55 -0700 (PDT)
Date: Mon, 30 Mar 2026 02:24:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_4/4=5D_iio=3A_adc=3A_ti-ads7950=3A_co?=
 =?US-ASCII?Q?mplete_conversion_to_using_managed_resources?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMRc=MdP-fvm4WWgFdHabCnVbc=rV943YhwrCHaCH9VCo_ZJJg@mail.gmail.com>
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com> <20260329-ti-ads7950-facelift-v4-4-c568c508c49a@gmail.com> <CAMRc=MdP-fvm4WWgFdHabCnVbc=rV943YhwrCHaCH9VCo_ZJJg@mail.gmail.com>
Message-ID: <671889B9-1D36-4F00-B044-0173A13F7403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.96 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34421-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: 773AE35831B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On March 30, 2026 2:20:33 AM PDT, Bartosz Golaszewski <brgl@kernel=2Eorg> w=
rote:
>On Mon, 30 Mar 2026 00:47:09 +0200, Dmitry Torokhov
><dmitry=2Etorokhov@gmail=2Ecom> said:
>> All resources that the driver needs have managed API now=2E Switch to
>> using them to make code clearer and drop ti_ads7950_remove()=2E
>>
>> Reviewed-by: David Lechner <dlechner@baylibre=2Ecom>
>> Signed-off-by: Dmitry Torokhov <dmitry=2Etorokhov@gmail=2Ecom>
>> ---
>> -
>
>[snip]
>
>> -static void ti_ads7950_remove(struct spi_device *spi)
>> -{
>> -	struct iio_dev *indio_dev =3D spi_get_drvdata(spi);
>> -	struct ti_ads7950_state *st =3D iio_priv(indio_dev);
>> -
>> -	gpiochip_remove(&st->chip);
>> -	iio_device_unregister(indio_dev);
>> -	iio_triggered_buffer_cleanup(indio_dev);
>> -	mutex_destroy(&st->slock);
>
>That's a functional change, there's no corresponding conversion to using
>devm_mutex_init()=2E

devm_mutex_init() makes absolutely no sense, as well as having mutex_destr=
oy() in remove()=2E The memory containing the mutex will be released right =
after=2E=20

--=20
Dmitry

