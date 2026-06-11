Return-Path: <linux-gpio+bounces-38339-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C+AOJ8WmKmqruQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38339-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:15:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F8671BA9
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:15:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZmkW0Ror;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38339-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38339-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9AFAA3008986
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334623EFD03;
	Thu, 11 Jun 2026 12:14:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1803EFD22
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:14:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180095; cv=none; b=AJyIEJ5Wo7uV0KlfEUteLRNYyYsbXCCFP8pw4i8Lx+YTpqKYJcKbe8P2gnb+fmRMdnfYIxbIs4YQgX6AtksDB0qBWcuHnwU6i3ajwK8Mxe3ooKdvExdBoNZyEwhUsnR2PKZ31mofotak05X5hRIIqAQrMMu3W5XS8g316DfN8X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180095; c=relaxed/simple;
	bh=v4hU6Kr/BAVpowzp5fsRs4uKju+1X7rrM4xIJBc7TQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpKM98aMkT9ZJQZ9CPmCEJd6zKs0iDMGOysjWPdTgx0cCIWdAgNZ+Q07jqCTNZpetluvWV+DLFQ1vLOVCHHGjLh2UrCJQWqshV8x2rIbDYKkjw6MqD0iG2Gz5Fk76rxqosFyYIzM5Qwg1sGfNdmlShg7i+uhJ1GXe7w4CmJaimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmkW0Ror; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D721F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180093;
	bh=v4hU6Kr/BAVpowzp5fsRs4uKju+1X7rrM4xIJBc7TQk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZmkW0Ror+6nvgPWvOTe+i50+KcQUXQHXk/HkUjMjfj2NtX+GceUtbbNH9WzM0stZP
	 Sw6N5KUIH6f0hkDy8R1ADDHOtvBTJAdccLHQfH5ARcKvm/Pp9oclbJSNXZD7Po2UXc
	 k8hMfmpma44uGwenQol1i4VKt/SsRaM+E0EKfIbkYppAp6uo0jKKf/dcDx5zSn5HLi
	 AHK5CAlqPONkyAHD9q7y01l+eP5Zegcp++0bzEM8qz0bal/lfl/Z3akq7EKYnIXuOz
	 TmNocUHKiersW2lEf5NCBAeaVcEF1VbPz7sLj8Rtssb0k7rr3ipHgwJ/ga1/tAKdyl
	 gzUzNJ/MsXnuA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa6863327fso6984585e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:14:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Eauj3dDZg6e760SOUpBt7EzeqWD7/TpmzQB8rQIzm31xVepbl477ocsj1JI2EepmgvSGo3Krnb3dG@vger.kernel.org
X-Gm-Message-State: AOJu0YzVrNNGZaLwEuc6W47TD2Qgb1NUvmMZoYhMYafeUBI0HFBhs+IV
	vzLLNEppWhjvKGWABvE2PZ/T+508pGQDlBwa9/Wvfc6sLa4MkzlD0ByLiUAKoCwmyfQisjRN82a
	g/zxSYkDJ6TVW0iUMH+6wZu8WALUouPY=
X-Received: by 2002:ac2:51c6:0:b0:5a8:f6fd:f48d with SMTP id
 2adb3069b0e04-5ad27fb7e63mr741689e87.40.1781180091787; Thu, 11 Jun 2026
 05:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <20260602185339.GA404948@ax162>
 <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com>
In-Reply-To: <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:14:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLkx_zx_w_rSm9FxzbPOFMgMrq8NvfZecANLkmrMv=19fg@mail.gmail.com>
X-Gm-Features: AVVi8CfjPcy-5ZJyJQBdt2LZccagAsFKatwmZT0g2ZuMWBUt2mDfmGa4nRJm5QY
Message-ID: <CAD++jLkx_zx_w_rSm9FxzbPOFMgMrq8NvfZecANLkmrMv=19fg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38339-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:nathan@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 314F8671BA9

On Tue, Jun 2, 2026 at 9:50=E2=80=AFPM Hardik Prakash
<hardikprakash.official@gmail.com> wrote:

> I am preparing a fix that skips GPIO resources with no resource source
> string (string_length =3D=3D 0 || string_ptr =3D=3D NULL). I will test it=
 on
> my hardware first and send a patch shortly.

I have not sent these two fixes to Torvalds yet, so I will drop
them from fixes.

Fold in fixes to the two revert+this patch series and send the
fixed patches again please!

Yours,
Linus Walleij

