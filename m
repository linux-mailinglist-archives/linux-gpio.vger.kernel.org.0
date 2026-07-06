Return-Path: <linux-gpio+bounces-39507-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kKcOFqiCS2qSSgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39507-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:25:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C1370F20D
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:25:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aZEjUv1P;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39507-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39507-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92A9D3015877
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 10:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E249336C9EC;
	Mon,  6 Jul 2026 10:25:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA227EFE9
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 10:25:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333539; cv=none; b=lWjul6LcyOU1hZKmzoczGheSNlJ6moDaz58bkT1Rp0pCRy0Ni7YFyMR7SlMcM6C24BmIJnzei3S5a4povUey4dBre//7q9dTkaNXm2Daoc20duPIUeeKeBYYKbbBVNPIU2rVNHbkqorMJoe2owKMMCQtBn5TD48J87knkmVGgGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333539; c=relaxed/simple;
	bh=9QhyQqvVWvg3Gueft9cX+GxkLeGQLD4YCh9bV9yFq4c=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1d79X0Y32E6sULEZpVnT5YdqCaUKaAKoBqGNykMfu3Q7m7jfemdUFUoksKoczpC6FxbuXf+ujcDEVUDBHCAjAIuKBK6d2LS+doJBBm0nfLsviM4VdY+d0df2l9KL7OU9Kn7Ij7COQz/Suh9hKLr8rnVsDKT8kFUqnqOZR0jsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZEjUv1P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3251F00AC4
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783333538;
	bh=9QhyQqvVWvg3Gueft9cX+GxkLeGQLD4YCh9bV9yFq4c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aZEjUv1PChbCqWKoKy8iPd7B3spmOmo1f7O9+C8joqty6Dl7D2YB8QzNurr10IFUK
	 HiDlBXYsNo0LfPX5j+A4qTXOgTMAw1pSBbdYpY46AquXhNxyPG5pPEDsP5SD+2ubh8
	 cZr7IliiHfK5iIjsNqCy/ICjvML6SZlCt7edaZ3ZiC1OhcWdqH754HUQI/u+xcHpCO
	 nXuI8UKY+DnRXNp1rtJ6ubxROEGeb2onEPqUij5ArjPuTzyrJROUTnS5KpsupUL9aI
	 I7Bp2uS4DLKUYrP+NFDHKvKaISWEz0qataUr30QnmB7zTYRtMg1Op99fplau+rL2aH
	 j0CLAzLq2Tu8A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeba09900bso2287362e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 03:25:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqeGygO9km/1NcFYodQM78+hxTxAO4/PUksyirfgFZbaVfXPL0pKPgtc244xWXJKW7c9xZtGQYUazQx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj24MC4j1OwdP+RQIwu3VzYcJ7iAaVDjv1IC6vEbKckadhzTcX
	qH4K5V3Ajwf6kiiQiOcQyHTEy4+AyUeqbW/rKn/2FASRqhDjPko07imqR0Sqic9SLux+e0672td
	0C1w770jeiSqX+RhQ9ulCBP/XUPRgtFd5OqZiy1FcSg==
X-Received: by 2002:a05:6512:3349:b0:5ae:b6bd:f13c with SMTP id
 2adb3069b0e04-5aed508554cmr1849948e87.15.1783333537051; Mon, 06 Jul 2026
 03:25:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 03:25:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 03:25:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLnmyZauNi11xdPYUXZMA+X_Ztg6TNxkKrK+ATZTP=W7_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com> <CAD++jLnmyZauNi11xdPYUXZMA+X_Ztg6TNxkKrK+ATZTP=W7_w@mail.gmail.com>
Date: Mon, 6 Jul 2026 03:25:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf-Qz9F0U2c=C5CUhJnQbZo6tpr4Vume6K+KpNC=6+50A@mail.gmail.com>
X-Gm-Features: AVVi8CeEtGcN5qCNQYGBaXiQQlx9LhIodlRoiX7KlJz9MOXRhb35lWKPVJJFtr4
Message-ID: <CAMRc=Mf-Qz9F0U2c=C5CUhJnQbZo6tpr4Vume6K+KpNC=6+50A@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
To: Linus Walleij <linusw@kernel.org>
Cc: Ravi Hothi <ravi.hothi@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	ajay.nandam@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39507-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:ravi.hothi@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26C1370F20D

On Fri, 3 Jul 2026 23:04:03 +0200, Linus Walleij <linusw@kernel.org> said:
> Hi Ravi,
>
> we are in a bit of maintainer transition for Qcom stuff,
> Bartosz will apply and coordinate qcom pin control
> patches!
>
> Acked-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij
>

Yes, Ravi please Cc brgl@kernel.org from now on, the MAINTAINERS file in
linux-next is already updated.

I'm waiting for an ack on patch 1/2 on this series.

Bart

