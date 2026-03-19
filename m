Return-Path: <linux-gpio+bounces-33808-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN+tKn/Iu2leoQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33808-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:57:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972F2C9245
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 10:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E897032708B1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 09:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80DF3750AE;
	Thu, 19 Mar 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMuFV1Lx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3EA374727
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913578; cv=none; b=u+E4JpjSjTmRVyD9HHTVze74yWrPNYDErBtInHlaclzlf248vyfCIPX8Obije6GdZrC/y1YXwp4j9m4mG3HQqx5WAVhY6tXyMPfB03Lh0tGTvZnQ0ApWkPcs7mGQW6TsKbMwzwO92y+kbmncu8sy1rJwnLt9zYIbGc8hGMmO8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913578; c=relaxed/simple;
	bh=oijKMewdPgogYXQR9FM0p3Swk08ISDJV5pfBwFnYyYk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbflJH74FS8KD+SXyXRwoIS+5Em9OfpTM6xeC4WhfcvTc81xepgdxDzHKTIWvmw6TH2SYJxOj5jFO95tpSEx3zFKfk+cSzr4lmECYxsJKY1Ruo4Oty6KK6CJFlKeiWDxcNWDEHVYPVnZMmDE55yV0EY4k2O6Z0VbzWbI8jKxung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMuFV1Lx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BC3C2BCB4
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913578;
	bh=oijKMewdPgogYXQR9FM0p3Swk08ISDJV5pfBwFnYyYk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GMuFV1LxG6SzfIgBXZiSyP20E5uX2Uu8dcCazbe+AoJRqEoiX+EHXhmdHXMq8PbK9
	 FutLDgUhreid/9i/R3lj/GdEvTlG+wV1EqAsk7z1OcMfRutwWxfBWcwxNIieL3nv7c
	 hs5g9yI4Su69kY92k3VYAHVzsPzD/f32GA1Ak627A8mAAMQnZcC2PcjWvEDTduLC9B
	 wWM1BRMiApjiqTekiRNdhrvODFUlC/u1XHgbREr5IiZUOMidbV6ebdc8D+lccnwza7
	 xGRFzf/OQfIyVNIzqU1F7665BwYXHut7To22Swy/8AIsEYbUkiGv+ocl/QGbIESZ6O
	 lKMbxfWENDWqg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a277379151so623305e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:46:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuP9F8kKer3Pz0ai7lF2CrzcRYKk0RkySafU7y6mn3Fwri1uBtzQa4+WluJ1A6hqgULTUsZD8/gxtJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11Jt8HynxKC8LDct/F0Qz8lR+4HTqRJszil4BVmQwaoMQ1bHy
	tYGPPuLfzTNXsSPqnAWX6PfWxzPARyGeZvfDAtWKCeOIiZq/YxXSwhSNsJXo8FFkUegdrl3Q/Nt
	U4cXh9/xqwmjiY2M5+8fxD5S/PFZj7LTEpOAZLPNHPA==
X-Received: by 2002:a05:6512:20c9:b0:5a1:23fe:b04c with SMTP id
 2adb3069b0e04-5a27958b7f8mr2222705e87.18.1773913576985; Thu, 19 Mar 2026
 02:46:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Mar 2026 02:46:15 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Mar 2026 02:46:15 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260318-barco-p50-gpio-set-v2-2-c0a4a6416163@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com> <20260318-barco-p50-gpio-set-v2-2-c0a4a6416163@gmail.com>
Date: Thu, 19 Mar 2026 02:46:15 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfWT9Egu9aBRar2qyQ5_7CUL2hn-h1Q99nBmtuuh=h9iw@mail.gmail.com>
X-Gm-Features: AaiRm53xfEXDs_Oh6VhVv87lOcMbBcsDbeIpwCS_pmj929lMpmv03Yi-4X9Ub4M
Message-ID: <CAMRc=MfWT9Egu9aBRar2qyQ5_7CUL2hn-h1Q99nBmtuuh=h9iw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: barco-p50-gpio: convert to guard() notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33808-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0972F2C9245
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 03:56:18 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Using guard notation simplifies control flow and makes the code clearer.
>
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

