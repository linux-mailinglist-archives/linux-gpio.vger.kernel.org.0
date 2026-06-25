Return-Path: <linux-gpio+bounces-38898-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HTiqJEgpPWrwyAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38898-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:12:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA18C6C6036
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:12:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OZsVNqRM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38898-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38898-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F23630DAFDB
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 13:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5D91E633C;
	Thu, 25 Jun 2026 13:09:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C82FFDCC
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 13:09:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392968; cv=none; b=e6nwxMwXbzRtkhB3J9gOQZgPHQ37vtrKDD0oXnliZ1PylNo80jHMBkhn3wiLMoKb+K8zj0y1rOtXUMHYkRneDgP+R/mvOOYQp8Pheyw9WEEIbZXsomayuZB1j1sEKh0mdvotoM8PERAwsZUqml5YHmlA8RfqKrQNn0MR0JZsiO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392968; c=relaxed/simple;
	bh=i8twirobMQh5hCctEkEhKgsB0ZnH8enz7eMpmHK6cuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcbKX/U37VCI4LB5LRF0hr27+f6zw+nGG6kY4MvoiMknMDTyIZosp+xgSUnKOTtRgaaILLHJP4dBasiH43O8lbKhNaB1uSx+ElTvYvi0Py2lTNYlop+lAzskaeRrijAPzeRXvVBwVlgbJmYqyPWyEIUwb7kShXvP5/BfSOSUXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZsVNqRM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89271F00A3A
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782392966;
	bh=i8twirobMQh5hCctEkEhKgsB0ZnH8enz7eMpmHK6cuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OZsVNqRM82yT3tYNU07vz9+/4gkKML+PZ2oz4lHzTft7BoVE7zXoC8boqn3qHmP0e
	 uB6D6G8HpjvgUPMq9eIE1H6h8D5haAcGgUMtRotmm5N6zpYi0M2w0WLVnv/V1wj7YI
	 FyuJ/hzSkd4kOhvVCL7PngTaz/qHnJba9cCnhP67WvCA0MoRuIggh225HHWrocVR6C
	 5OsbuV6omST+m8Bguoi3Lrr6IrSAxXVasobQ67pBe9TaWBf9iaxQMQZoScMUryMCnr
	 v0xI85RDd6sf3PYULrA4tOYJW6/kGRp+rD6vqIJescj/a+SHQjK58E5R+TyeI5qFl0
	 dOvpJ1vvwE++A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aea367c965so498428e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 06:09:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEbTheKBQf/mveu483ps2O8IB+Kf/pupzjNDDzsz+Hg9TRyLLvkmj9FSUA08tiOw1/QyejOTxAyJ+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwZR7QZGo9hl0HPoqhQuWb/r2tty7n6p5E3e9oZNRyW8EYyjSnI
	CL81cxq0APGerGeIiO7SNGnB2nnbEJ8EZG0N7+Y7cBZRpSmMvA+x9C9gcpbRBn7iou/9uqs6wLs
	IFKeGGMYHHUDw+K386wKmI4JD6QgV0tk=
X-Received: by 2002:a05:6512:405a:b0:5aa:6a8b:43af with SMTP id
 2adb3069b0e04-5aea1f3f7e4mr811436e87.1.1782392965405; Thu, 25 Jun 2026
 06:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616073708.5534-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260616073708.5534-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 15:09:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLmxbpYdD-+BCAuU4viE+-Wx1AiFStuu_ce-RJ-v1DKT7Q@mail.gmail.com>
X-Gm-Features: AVVi8Cfc50MonIDjuhtzZcDmXNFpS-VNXDf-ysUxgGwcS9RY9GH-nXSDxuvmqqM
Message-ID: <CAD++jLmxbpYdD-+BCAuU4viE+-Wx1AiFStuu_ce-RJ-v1DKT7Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as the maintainer for Qualcomm
 pin control drivers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, brgl@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38898-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA18C6C6036

On Tue, Jun 16, 2026 at 9:37=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Linus Walleij expresed the need for a dedicated maintainer for Qualcomm
> pin control drivers which receive a lot more changes lately. Qualcomm
> volunteered me for this role so add an entry to MAINTAINERS.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

