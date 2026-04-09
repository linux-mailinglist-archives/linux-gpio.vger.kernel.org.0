Return-Path: <linux-gpio+bounces-34911-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE0bGmVT12lHMggAu9opvQ
	(envelope-from <linux-gpio+bounces-34911-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:21:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD63C6EE9
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AA5C301D941
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80E6374736;
	Thu,  9 Apr 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNk9th9I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D733CEB0
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719245; cv=none; b=OdXVERLhOxyKfg8Lo5X/v0FxYQqnemAqZupbcZKx5yrpNwv4BlCXHLBsEwAWqsNazhDLiOMOPZYuY9rZyMRv1vdx9PYXzOdY3LokFJzBwUWVfoH0H3F8bgHkJr+HsYpQ4Nbx1hNDy55kRSvU8PZSw1ZLdj23u3jj5IX1nDRwT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719245; c=relaxed/simple;
	bh=dqhEKFa1H6yEl3Do4DiQ/IbIe/eSPi++JUpXQ/++v14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwYHeu27HHZ1Fy6iayVjzLdmL2isiSMuDbUYX3rP2ly12OvFdEAwIcKbMyBituxIL5xjBUctwxeg9JkVdxPD7T5gs+g1LgYGqakVaUqaE82STTyEAPtDuY38b1RrCL/gVTME9E7UwF6pkoH0N5kY3tSHPdFp7RIKtqYRfSHIXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNk9th9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CFBC116C6
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 07:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719245;
	bh=dqhEKFa1H6yEl3Do4DiQ/IbIe/eSPi++JUpXQ/++v14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sNk9th9Ih0mlj2Fg+vqVa2/YB6ujiNh35s6MZ2kOQuv4tqKODDTbk+31/EodRLX/9
	 2UE1uk7uNlFjsnogfV3SQbktWbUxzlPt45XJ/z6x30Tw5TDRtBbEJtgJmYKepNnrL2
	 c0Z8oun0hALZGkbiCf8WBtG1d1sYw1p+2ZjrSp75ZHCFqo9KV1AhIvnAkkHsVEpSjX
	 Y5LGC2HbRsiSjnS0TQKQF7m/0VOEhQq79Dxgplz+bIDpBUnOSQQ8gW+7W3G8ZxCgzz
	 LxddLSO1pZoLATO3aUjcfWH77AbOx6N7Jg0BzrYNd3krrskp5SsFYLoopUJKh7io44
	 jLakohBAr14ag==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6501d242e2fso537971d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 00:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLhrjQdMBZTjZtA49zNZavvZkBYk+5RjK29WWAQBzEZYdL5KZnX9Gr+QUerFaw5yPNLubVNvMKNkV6@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWE+cyzWuI+JQWs2BXnxfFDEP01r2deDgDP4y/xalgRfgDg6E
	4fFgbwb43j4bzXtNQ8unh8ghu1gr4MrZPcQkw06oDjLf+RP5MGfqw7iUy9e9Thj56cIyrc/KAPN
	DZGPG3jjaIsgszjGM32QhbmBMMiakLUU=
X-Received: by 2002:a05:690e:b4f:b0:650:7a82:37e6 with SMTP id
 956f58d0204a3-6507a823a8amr9981349d50.49.1775719244730; Thu, 09 Apr 2026
 00:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408223038.52264-1-mailingradian@gmail.com>
In-Reply-To: <20260408223038.52264-1-mailingradian@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 09:20:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLmY=B1qqDsVrouKwRMTjxJWjgkNZ7NtQQEjpetS-GCTKw@mail.gmail.com>
X-Gm-Features: AQROBzB5wkparrtSNZIw3FJmzl39hSySIKgukRSqL0iRLLLNKu3j3FowAO8bsL8
Message-ID: <CAD++jLmY=B1qqDsVrouKwRMTjxJWjgkNZ7NtQQEjpetS-GCTKw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm670-lpass-lpi: label variables as static
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34911-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10FD63C6EE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 12:29=E2=80=AFAM Richard Acayan <mailingradian@gmail=
.com> wrote:

> These variables are local to the driver and have no need to be exported
> to the global namespace. Label them as static to fix compiler warnings.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604080950.Mvm8aN0a-lkp@i=
ntel.com/
> Fixes: 9826035a75da ("pinctrl: qcom: add sdm670 lpi tlmm")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Oh I just made the same patch, nevermind I'll apply this one instead.

Yours,
Linus Walleij

