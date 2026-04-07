Return-Path: <linux-gpio+bounces-34779-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ+cKNTo1GmeygcAu9opvQ
	(envelope-from <linux-gpio+bounces-34779-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 13:21:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292A3AD9FD
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 13:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD631302C6F6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 11:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2194E3AC0FA;
	Tue,  7 Apr 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8iv5U8c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE273A873B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560852; cv=pass; b=rb8z9ObJGe8D3IQu7IyF60heToPqmjLcuIuLeu8YG6C9ZhPcxa+7WVRGba+ULSyr7O31TIU3pe7Gqo7j5OyqvsyuxHJRil4z1Z5U5xLmLR09DsgUx5DKnvkoSRygT7Np5OVSGczuciYOVQeMQDXnph2OJEiwy0nBcmNv0+VwS5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560852; c=relaxed/simple;
	bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2vkOjwF10DbXEUAm5eW/vTwqElVTdnZXO4/xISkv7wUllcBE9wQ2MRM60XlXEX/dArC11VZMKmFVhkpcPoDTrtD+hXIikMqapbwsAZgC+KBm8iJGHFwcHuXCg4wobVAPqYvfmqquJF90eLkGXLcEoaPF0ZKTyQ3FLOnPiLdQfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8iv5U8c; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b150559bso14538945e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 04:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775560850; cv=none;
        d=google.com; s=arc-20240605;
        b=Wn+P7SxOtakEUluf/cKdH1N3S9IA9G84XCnR38vvMHQcvwG7ZZyIm9kKhE6mOGJChn
         OToyp7aW0SyQVAb3w3B/mf6KJyPymXYSngHU1mtCRJvuBZq7wxvMRDraOvJuzzSlfHhs
         3yMC+vybJP5nZKpt0Pi1WAVNNYddT+Ul0JVu2dJlW0MDMZet/sO/4gRpCnKSoqaV0Gw+
         Bl9DMqSqItdUGmsVZ3aA/tM/QSCu2EJo7Mo3ujhu4e+xourcbwQH2peT2Pu7KNPyqYP4
         y4hpHjb6imI/+tfVEahZGOls7uRfYuIqejcEOS7uZfCKF54JdOZ3g9fwT7GTDN9/2v29
         pD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
        fh=h/z1cR0FONHL0hV+LXLgk2z6jx7vUQHwR4+N/x428hs=;
        b=TTqago9kq/7xebcyUYJMKnnIbPHR0vTN1MLsBpySzvse72YEJAp/LX97IMVnugctxn
         UAy7ly8bV5W9x1p+ykVquluxlel/pUj+5jEy6uN3aWqfwe4g76gfZ/uKA8l7/t8Pa6Uv
         0UCXcf59PmTw4HiXdDDnIZffO5m/wNT77S5N8JRZu73K2dQ3EPac/fbBH6oEJkzPqyQs
         egnyseKez4fYJJd5gkNpXa529FqTyp5ySqNIZDgD1JRvqYDyhy+wM5SbG7+6AXZsu+UC
         DenHcLnhzEBH5iACAhu8jA8xzB8dFhApRM5AjaDYUwvtUp9Fr5UlYdzbl6LqDakX3+O9
         lHiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775560850; x=1776165650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
        b=W8iv5U8cnsHlKo1KlIuizat5D5aTX/JcC0g/IR/gtE1NABoI1q5RilHESD+FIw/Ewo
         0eMBFzp6pQPDqpm73CRDbHOXcbLYyTXrX5zmzxspN/vDZY6yk67AKw24Xmftj3KAJVDQ
         chWSFgOMiYAAtEsLQNlxUW9WiehtJDBw43uH199RxAQmEb8ADRKRJKTh/CbOCWUsHPsA
         VMcZz3IwxqPL8SHhP6RTGDGAYsiZOzVuAMR5BE9kVOnY2fkCOvtXKqofnhgIou6jK8uN
         hpR/CaIl311q5xFtmoLas7QRcV/QcGubL2jj9/ANTTNA19QEoQH+FonFAaIWEccZ4od1
         8C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560850; x=1776165650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
        b=bP8sYf7ct3p7paCqqgSK6gxhALsqW2T3fIgEroIQlr95Ap7omla4vFOcP1RBDfU0d7
         VBqhvKUivPbylTmx6ksSGO3aiyS02N4lLxKfLlYhZjW3PA0lr0A9kTwuEsDdjj3EkbfY
         b0Tpj90u7aJMhIMhmXQpaflFJQZqWNRcLYd5QX7tfhIVgLxmFrFF6YL/BQMFWJDEpYcp
         rQnEu9PfPMNEtTRpQQjUH08jHJqqMxq3pHK2TxG1st90T5tTR9mZ+6iDqP474Ta4kQyW
         YY/zCd71drq7BgDp48+I9n4sMyBsPWe0486feYk241t5iX2kxWXkS+YUiSfOAmOpWDni
         PosQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwq7uwTYKMZ4D0KsYKFCnpo01qFavjG+GJvvqkgZHTlE3YfvD34/koLBPTJFxuc9T/dUmicKYVOtYZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3I3WOmXEeaVfph2hWnZMStVJNXOVT/2YU25/z8/F1zXI6ygl2
	Zqa1cZZRDR7FHo7qnCbdtsidv8ADmrsF4ysJysyVlKLIY8ZWnazvNZuRQU07QFrsgGbUD8gaJJG
	nCotr8ciTL5dcE/SsFa4evlt3/UI5GRs=
X-Gm-Gg: AeBDiet0Qg0pQMdarPXUTqtklLOPLDR1uGojr9opIVolafFRuvkMP1AbE/FIBt4p5Cf
	MxISKYmBV8gQwWrHm5wue6/ckOHQY9pqNhTj+pXINhPJR7mQwN74a8eF/Sbhm2tO5ZTpilFNQTP
	d+QHGGbbwluui6TI3Ko8kTzbXSAY/weKwPaj89xnoIfpH2pGYbtmSuvjFIpUO6vJnacXWcaMjZL
	IS+mHtwt1PgHX5SyjEMP1greXUUXD3bc1eWEwboAkO6Jhm1x1PJgcxX1UUHIu0hutyACfiACiXR
	+cr904Tw
X-Received: by 2002:a05:600c:4f0d:b0:488:b187:d898 with SMTP id
 5b1f17b1804b1-488b187d996mr103135575e9.14.1775560849747; Tue, 07 Apr 2026
 04:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406075114.25672-1-clamor95@gmail.com> <20260406075114.25672-3-clamor95@gmail.com>
 <CAD++jL=SQsfwOiaTQqzPmbuUECtNi6qO+yuYXgTps0c5SV1OYg@mail.gmail.com>
In-Reply-To: <CAD++jL=SQsfwOiaTQqzPmbuUECtNi6qO+yuYXgTps0c5SV1OYg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 7 Apr 2026 14:20:38 +0300
X-Gm-Features: AQROBzDtU3EBKs_1guMqhJQIuLAgaICFUNiqLjWoJ8SqPDUbp8JTVqn9mCj0LG4
Message-ID: <CAPVz0n1Vdkb9-jrJavuv5MwBbt8Oh6ehAX0F5GHUZ6z8hDeHFQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34779-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4292A3AD9FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=B2=D1=82, 7 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:59=
 Linus Walleij <linusw@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Apr 6, 2026 at 9:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> > TXT to YAML format. This patch does not change any functionality; the
> > bindings remain the same.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> LGTM but waiting for DT maintainers to look at it before merging.
>
> Can I merge this one patch separately to the pinctrl tree?
>

Yes, if DT maintainers find this patch acceptable, it should be merged
into pinctrl tree since all remaining patches of the original patchset
were already picked and applied.

> Yours,
> Linus Walleij

