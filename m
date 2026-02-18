Return-Path: <linux-gpio+bounces-31824-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLz+FQhFlmmYdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31824-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:02:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2015AC35
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A953045031
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 23:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059A733A6EC;
	Wed, 18 Feb 2026 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGX/Meyx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EAA2773E4
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771455688; cv=none; b=JQbkUI0FUH++alK8yu6ke2cvtHbgvgS1kokgtykK+NXla5keHkEQRF1oCWttFbmwUzNUmbyA6E4GM/58HvBXofYKQVzYOzJYP2Ag7jF6Meoju8rpWz9PdJEc59TZ45ApCUMO3f/8RvukyNlHwxbtUY6M6zJcytBYVkkbcOXi+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771455688; c=relaxed/simple;
	bh=7Fp7LCS6gSA1q4tnJoZToIeqZIHSRnN2c54fC8YGhrQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=N1eGZk6rh6JXdWDSton1h2+/ASkmJj6MGCofLSpM7bFgDauuQDRKUNHeVFsIL2EB8LiZaCyDXVUI8WI6vxjHwkslYmL3IzpZZIls2YrJeAaRZ9clqHl7SouY3JZHaI4XLA7HU35ZcQyXNfA36ShxR8Bg2VPJgBlSLU1qk2CRuTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGX/Meyx; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-124a635476fso360503c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 15:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771455685; x=1772060485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Fp7LCS6gSA1q4tnJoZToIeqZIHSRnN2c54fC8YGhrQ=;
        b=aGX/MeyxsIp7tSlHFvC56Y1T7hYZgkkUqn7CNd3iU+iz9d7tiNE4HZ4tx9Jx51rulj
         ADH7KtbZgGnRZraudOMq5iJdWOGmxtrivTRhcOTuGPUmGA/c5p8dJsNPVtRl7mbf6RT/
         5ngMD1rupLel1g05RpiMd9bh2/gQlDnN38kodp3sBW0QbzU8b/+AfX6yxTJ7cDBfPv2n
         g7JOh8bdpvfgSHOU6Ne30XBPv6JdZ9Zlr4rfkAJ3n29TXmwS2GytY/NjuHJbqoF7+gbS
         et1aa0JrAcffn8vquK9ncpwtM3NdRXWf/7WMBQmqo9tLglc0GeiDUU381N8knAhNDYpM
         Ij/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771455685; x=1772060485;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Fp7LCS6gSA1q4tnJoZToIeqZIHSRnN2c54fC8YGhrQ=;
        b=vn+6swAa19lBC6QglNEOMYIDkMsboOhD/BD0I0f/is3VpJQve5070MU6b1ZUsGMW6R
         dKL/tH+uA9vVQFQuwjBKTBY1h6/zADtYVcSX5Aa/cBmX3r/1+R6LWmReYprbj8+kg+l7
         8jcsx6NYqrqd2gwmHLxnG+FHIsMHZWTL5JzjCx7O1DDugHBljM0vJSM7cucf318CXPDe
         j6BVEcjOUDB2P3FF3b3bZHFyPEMwg5IfMbm79ThmnVgqzTYdUWZOW+REkeM0eFhUTQCo
         Njq3qpHJraY/ScRzIweMKDXelpStuBdgnMf5qkhYFih6xuiTQxXVltzA8XczZQLl6kB0
         OYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL7q1GsoWM2lJN6gdZH4CFEUgOkNxlxAV+bFmc2uNdJkzsKKGyzADRcRzV/G56IwSbClDiKuOr/4Hx@vger.kernel.org
X-Gm-Message-State: AOJu0YwTOPe8apkr49B/BMmLwZslUIikzbUsthnAEqWUNBipPa3TGFSB
	YBqZDCS+qZ82s4L5xEd+J+WhTV/6zAF0Q9P+jKwyaDBRVRUxx7TZLDxo
X-Gm-Gg: AZuq6aKYiU3Jg9HV9/+8uK2imzRDXTOezPc9kr0CZP/gUDl6LTiV2vLvTM2JVMZC8xA
	2Jsv7dIbW4QBx9JBGcvBU65lfUejX+SWkC2Jjj5hKGNMqzUVfYF2hh1CzP/xVaCK76JHYslIyrd
	Yh3zuVd+pgkPqW8N9K8+dW5HfkkoMKHVag0wmQoxr2qO+MDHAcuIwI3LrYJmp5jU30kYU4fdHB7
	xyjdCtYZchscZHVVFkVyxAIhv12NmlIRDkHOeV3sqODfDogosS90OhAadSABnL6WN+tjSSh/8Wi
	iqxmr8Cqnes6LyluwPxmC7dJ833uUR76lrvXiuQiSWrRZ0t/Z3p/X2x+c9261IftyxoXQ5ekLHm
	GiR4fhGjbVqWtdDAPrV9rTRkEN4OY7L5slgW64I6CtEAXCp4BpjhGj6c2xuVYaoTdCnu/WFng0J
	LDXpQ61+oDCUmTPZPgvcgzAdBrObw1jj2eDB5Ks60F/3I=
X-Received: by 2002:a05:7022:2397:b0:11b:a36d:a7f7 with SMTP id a92af1059eb24-12759a1eaf8mr1759048c88.16.1771455685235;
        Wed, 18 Feb 2026 15:01:25 -0800 (PST)
Received: from ehlo.thunderbird.net ([2607:fb90:3714:16ad:ad3:2951:6443:3ac7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm26802662c88.5.2026.02.18.15.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 15:01:24 -0800 (PST)
Date: Wed, 18 Feb 2026 15:01:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_net=3A_phy=3A_qcom=3A_qca807x?=
 =?US-ASCII?Q?=3A_normalize_return_value_of_gpio=5Fget?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ba73d17a-1d7c-4e66-af6b-d8e5a37358f2@lunn.ch>
References: <aZYnWZqfzKwzzF4f@google.com> <ba73d17a-1d7c-4e66-af6b-d8e5a37358f2@lunn.ch>
Message-ID: <893C889D-3440-4DCC-904F-CA4228C48C50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31824-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ABB2015AC35
X-Rspamd-Action: no action

On February 18, 2026 2:55:32 PM PST, Andrew Lunn <andrew@lunn=2Ech> wrote:
>On Wed, Feb 18, 2026 at 12:57:17PM -0800, Dmitry Torokhov wrote:
>> The GPIO get callback is expected to return 0 or 1 (or a negative error
>> code)=2E Ensure that the value returned by qca807x_gpio_get() is
>> normalized to the [0, 1] range=2E
>>=20
>> Signed-off-by: Dmitry Torokhov <dmitry=2Etorokhov@gmail=2Ecom>
>
>This appears to be a fix=2E Please add a Fixes: tag=2E
>
>Also, please put net into the Subject=2E
>
>https://www=2Ekernel=2Eorg/doc/html/latest/process/maintainer-netdev=2Eht=
ml

Will do, however I am not sure what should be tagged as "Fixes" - original=
 driver commit or the change in gpiolib tightening the checks?=20

Thanks!

--=20
Dmitry

