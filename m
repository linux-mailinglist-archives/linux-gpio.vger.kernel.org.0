Return-Path: <linux-gpio+bounces-35406-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJimIFP66WnkpwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35406-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 12:54:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8A450F25
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 12:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF45030649CC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736F6386552;
	Thu, 23 Apr 2026 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekCzKYKv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A03E3DB4
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941316; cv=pass; b=nYI8Phg8M+8w9dt2X0BYZJ89wod+PMMLsdPwB0TLF+lLc4iDTNMGgTaQ24d4S6dUvya+Btvg5QQydcpbk1+K+UU/Mi9UhulqxwsXBA7+zn034d5FS5VrfJLagl2zs7N4bU3DyxyYK4gyI7Jm74rf3KL/toBV8ceDnapSxLKHKCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941316; c=relaxed/simple;
	bh=7sVv7IX2Y+T822sUPh+EP9ycZM1Lmxj7dcEuPSqXZrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZMj1RQMYtAz+FtrlIdIXxWsQ/7SsXyTOfcHMIS5oOqn7MW0Z+tCEjJI4qiPGmG5LtHVyciepJBpJBBIf2PYPsZIoMY2qe7yJSwhY3i6FNKh6TxzK2OI2eeImyktaFOAlQh7WO/Nsxz3B82uosN4vCO5+WTmDAoGDnI0EYSs3E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekCzKYKv; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fc4425b6bso55763647b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 03:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776941314; cv=none;
        d=google.com; s=arc-20240605;
        b=PHW5LzF/dPdMGAfb+ftuc331D3p092xDRb/NA8YnesBlQzP3hKmrz1xWF5w8XWdEda
         Tnaq92KuQAYgYLdJdwVVP8hXKxrTWNDzqCJmgS3p2ETWrUxRZxbwkE7UpOeTD7FZY+M4
         bt5lnrgrBugmuuzcv2q0v6mkzOKHhMfvrFX0+1CNLuBcAt5jBJd7zcFck4tCocXRdfQk
         /yuzzVYR+qcJPdLThPFW3B6MnGIiS4255ORXAokQ/rJ5YmWVgNkd0YhpEUea51b2kDij
         vG3PXrs3c0+MF10ngC3QY8E4jew6CAObTih43uKW0ra5OKyB/Vz7jKFwsiP5L6rrEYsV
         0LHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7sVv7IX2Y+T822sUPh+EP9ycZM1Lmxj7dcEuPSqXZrk=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=RH4Svp1MyGfmJdotd6W8MVZDn8qWCOgcCOwOaRu4kyBroiVk7YlXz3qqT8V+xPwLyl
         cd905WtNY/Qw9sOvJEfawsKlXcXOlGUSjJ674bxSTC6oh3ojoKdBCxOCeFqc/QpFCO8+
         w33q+40K6ENkRfXH6jGFxnbkEpffuqCu/WgBau7GpcU8vKUHfbZLaLplT9W5xAfZ6EOE
         6fyuF0YuAvS2zCCLtewnaXIDqfod2z0wEGwI5t5rAed+rdnZQ0cXxbbKMpCEnbtySet2
         KU09Br+HvzFK3Ilm9Nt2ttjB/jUjKMlhvQXNW8L4bhJ2e6jjWgwhWJXgpdvmfvr8GAKE
         Ym4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776941314; x=1777546114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sVv7IX2Y+T822sUPh+EP9ycZM1Lmxj7dcEuPSqXZrk=;
        b=ekCzKYKvrS5WydtaIvaky87EkJk2tKHAYOSu99sCvAhfEDASNR7zq9/HIBf2BSOxIg
         8pfq0iFzrVHHdiCBchVEutOA0JqGQ2zn2pes4JFztfcdtuG0n8eElvzHnizZh7mhoRvE
         GQma8wPY4SDhJlGXzduO5EIdlsQ9205eg292NrDXJZkEMOkiY8vNEuqzvtBSXutsAJU6
         ZwimSAmO7/Sx+mqgAN/Qo5B9sLDYcL2e1Ts1c3m7Mm7rv/33std5dDNHFgSIi8RV3l9m
         LuO+2Z3xAPPtkxFwtV6pmOO1IloiQprOOlgsVz0TQEWd59ZzPo0dm4cnFGp4ZGLmbizE
         m6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941314; x=1777546114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7sVv7IX2Y+T822sUPh+EP9ycZM1Lmxj7dcEuPSqXZrk=;
        b=VxSJ8/cEss1tf9ncZCH1a96IiHAi3yi4tZeZzne8ww/gB5s62OvcZcW1BtO3DBE4Nt
         UMTrzKXwqNobhiz5ZhCtWhfXO0tqEx3BlEJ9ZL1ajgn/KttrtqYO+3XdJXN/SOEpyjjn
         BkLYJ7kjk9pUI9srk05P85XzUPUTr/jj0dwT641/p2+FuEdlnjr9RmAg7klvsOemgzU9
         rCtkg+XBCrhExyPgwVSYE9CSmSLCsrRiFyF3S5urdu40GlMhRRZ1FmT1EtRtFAo3ubl4
         XyMd7OaixN95g3jRoAW+PLZSonDgRqi5qys0tRRZxi9GNvge54FEp/djx3hjQobGVsJA
         itOw==
X-Gm-Message-State: AOJu0YzYfyuyWo8rjI9kNZscIaINVlObfkzfwiDY/alFkVwHu2dSEEmh
	uWHLYymhje6zVQlOkPRiiejXSe8c4I6KHVwTH8a7x//28MVii7/Ls9vsL5F9DWazuKUfF3gLCFI
	HtT60ljmA8q+AgePKEvgz/x6EzEIRS3A=
X-Gm-Gg: AeBDiev+3F/3zJyAOV9/vkuJE7SUwAuNI1dQVz4FJLjISzAMvYx9jExpaYFjSITkIeE
	ob89TAH+ng1PADF6SfzHCVgOp7WXaMe0I8wBqEGUvEkscYqD1lrzcEPktBe5CAKmu4ccJLGaFjm
	g08jVUYo6wfkhUFS/eXyU8OzZLt7RPkIeNmW0eMKKEUf2nMheqfmYIuAVID1IJ1LPogy8YqkzUs
	zpBwKVtv59/l+/eVeC86JR9qczOWkpwHbPtv4dYjDe4szqFIpeCEQ/zV7WedVWy61RahPPaHP+p
	CGDziy5aN/5wrbKKQLDsaJKLrjq0SB5/ATh30jz3dHXXOTS372vRco0ITZmWAA==
X-Received: by 2002:a05:690c:c347:b0:7ba:ef98:9704 with SMTP id
 00721157ae682-7baef98a6ffmr147840797b3.12.1776941313968; Thu, 23 Apr 2026
 03:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422012041.39933-1-vfazio@gmail.com> <20260422012041.39933-2-vfazio@gmail.com>
 <CAMRc=MertT4WNcv7h9Uv8+-XWObXF_NmXsf-e5ZE_W8FXz-T4g@mail.gmail.com>
In-Reply-To: <CAMRc=MertT4WNcv7h9Uv8+-XWObXF_NmXsf-e5ZE_W8FXz-T4g@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Thu, 23 Apr 2026 05:48:22 -0500
X-Gm-Features: AQROBzDxUm15rC_K1P4LLWOegA8uBuEZekTAPKk4emLon5v9-Negfh6CvZ1BXAI
Message-ID: <CAOrEah48_1Ga9oBKWWbEEBbbNNs1ojTkygw1HnPp7t8wXwowUw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/9] bindings: python: use Py_RETURN_NONE in chip_get_line_name
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35406-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D4C8A450F25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 3:58=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> I think you need to check the return value of PyUnicode_FromString()
> right after the call.

Or I can drop the patch completely.

There's no excuse for trying to be too clever here, which I often lose
sight of, just for the sake of using the standard macro.

I'll update the series to drop this, but I will add one more entry
into patch 5 to transition to Py_NewRef

-Vincent

