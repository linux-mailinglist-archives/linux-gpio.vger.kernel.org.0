Return-Path: <linux-gpio+bounces-31203-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIcdKVbQeWnezgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31203-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:01:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E339E8F7
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F169303AAAA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD30A33B96E;
	Wed, 28 Jan 2026 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DumXYqcR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771533B6F5
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590649; cv=none; b=Kgd6AcTcReYgjcrMYNrI/R0tqpYEcb95m0JxYtP2wKruDM9COZiHv9X06/Wr5zrtK7gEhd8rxyGAQ/DFF0HBG5PbQiqLyXDlr60DxIifsfPSgsxeV11JRyTiE+0FBTWOoTjClKnhPzedzdYEDWvEf4ZSk05ZOwABrCYvdD32q4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590649; c=relaxed/simple;
	bh=ZghCFjy5Vl4uM4uCuKuBt6WpSu0c9RUlE86wYJFHhdU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URDvFvDTe2DPgIleVJeIv1/FP65pCzcZyUV1s12nQSwN/EuNsxtWC2Pv1qIKJm3FhS3JQ4w4Z5tRtDRS8SqeOcpplimy+fwXM3I9DxxdaIQPU/RcLDJWfX1pp4SKbacYJh203Ob6ovRoOfn2MAkDeJn6JQ6y31RWtPehGJJU40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DumXYqcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A131C2BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590649;
	bh=ZghCFjy5Vl4uM4uCuKuBt6WpSu0c9RUlE86wYJFHhdU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=DumXYqcR9zXUektKQP9grbUMZImpoZcfCL1qap4xXtzk3yVE+QBmkRukEovAPjGrG
	 lEHgGzEZPC19e1aSyUpkYqW+TuSOVWmggWkhTZrx485oXQQpG+niwdWA4HE2Wxhj2F
	 Jk7x9fK0NN3hG/oLTtZCkt7490FUqDf69NJETxDgVgOvkwA3IG9ZaQ8MdW18nLxF/8
	 gw1Y/lEaBmyXJbxS1VAqSnF3rDJTYyu3Qxk6CAEYVJDREPPpUFHzDv6VzhrODL48n6
	 rrtFVBj87j09V9FqkYLCZjjWqf8e7KTXaeL9FxqdT8w5zPhe6Xx8FhoDskCr6oo2UL
	 eEQ5ZdwFRl8cQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38305f05717so54293001fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 00:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQoyJIxA1Ke/ASfhHzEpJygkJujcPBGbjwDyVUPFUNSB/EKr3qvNJ9OyHpvi0r3uEj1yJmbhGZNaqi@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPmw/hJLjc5Y/OtaO7cIIUgtgYZ0Q4WZ0jmvmzXKs8KZ7a1xw
	+oZJYr89l2shDn2n8zCBN6mpdbbxnVgzdPUjJlIGCfFun9J1+QqdJrKuakY3IUq73sFtDH6iafl
	2RcedsTVGxkNmaISuyFJcsOFK/HSDjD90r+wA7hX3jg==
X-Received: by 2002:a05:6512:3e02:b0:577:6e42:3718 with SMTP id
 2adb3069b0e04-59e04015376mr1851496e87.7.1769590647815; Wed, 28 Jan 2026
 00:57:27 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 00:57:26 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 00:57:26 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127103325.3925173-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com> <20260127103325.3925173-2-andriy.shevchenko@linux.intel.com>
Date: Wed, 28 Jan 2026 00:57:26 -0800
X-Gmail-Original-Message-ID: <CAMRc=MeNOX8ob0y89Gx9u3U3G7jmhmdvv-u3vqnFqv04EOEFGA@mail.gmail.com>
X-Gm-Features: AZwV_QiaWF6S2zXsXWU5GAAmA9-LLTqcfAROoyRkpsJQMqGVH1YJzm0KMfvQkck
Message-ID: <CAMRc=MeNOX8ob0y89Gx9u3U3G7jmhmdvv-u3vqnFqv04EOEFGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: core: Remove unused devm_pinctrl_unregister()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Philipp Stanner <phasta@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31203-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03E339E8F7
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 11:32:06 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> There are no users, drop it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

