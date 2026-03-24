Return-Path: <linux-gpio+bounces-34085-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEkbLWmOwmnDewQAu9opvQ
	(envelope-from <linux-gpio+bounces-34085-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 14:15:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD430920D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 14:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 864A43056B4F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 13:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590E93F87FE;
	Tue, 24 Mar 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAJ1bwvE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA053F7E67
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357860; cv=none; b=PqtEejCwe7N5iWKe3QlIXNu2nihJ4yrmpRf9MNNZ0gDY1B8LL9HfDuJSS3fA+WLi2+gdKhp58Rk02R4rY8in/htB6jJ1+bf33E5/vtRHVI2TND5ig59ww85L1kP+DuPPjWculbpkrGaWaHlz0cp2qwSW8dsZJf/IF7o6KParFEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357860; c=relaxed/simple;
	bh=ORbDg8+0Z2ANVi6DavoUZdnquVF34S4e8d2NiLiHAfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEa4ObPGpVzDTTFf8uTg7ZZOX7IJdkuzVW+h4vWDfwBHxRlqVEFf0HlCjDMabz1dmWjOSRbgiKpDlWcTrI+pNei5NA+DOYE21RcASUIDH+4tw0efau13ct9nYYDqUeQENFp0Mj1upmUBsLrzDw6lchu16KFTEqZ1KNDiNzAXsVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAJ1bwvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEC1C2BCB7
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357860;
	bh=ORbDg8+0Z2ANVi6DavoUZdnquVF34S4e8d2NiLiHAfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dAJ1bwvE/ZSWO6JumYWCZ9c0P+EffpxSjDvLCbFIdN1ytGZfKPldgSmkDxowsZq0m
	 6izQMHzNmwTe/TOtE79Sx0Hfy3sRYTGwXV2X/wBikko1aM54bhuD2RTeyrxsgraWAE
	 z5pBVHqurNwb9PoZ0wjSNjN7qHVLuzEFJT4nV3J/0VpPlPf322klZLZwRJqCB5ij6+
	 5hJ4frZbwJOYYppJsam2O9lEIAYCwA5659Xkdvoi7sn4KNpEUoy3+hu3rB0bkszdVI
	 wnMAlzfIxcrZ5oenX7WyI0VFjzV6DZo/v5zxkxu3+1+6sbnADS1syY+htnkjaG56Mv
	 p3pOgbLCWcovQ==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64edf260b49so575368d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 06:11:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUW4WbtK6cUZT/dV1xYUHRByRahmwUhub2Khtx7nKMIsKL3pVUp9Frs3dQUvTWdzWSgOq+BKYLBk+Nt@vger.kernel.org
X-Gm-Message-State: AOJu0YyncYQREJlOfZJOMHbzdMeHDFakLoX2T10nRN8t4lOSVc+0l9ZJ
	W8YyftNTIY8vAkINDM5WMMWO/sTHM6UKm39u86mFHmJ/RYFl4TLBNdocAtVftVdBKcHD2nHBNp3
	8fAO9WWIeyQ2Z5qcvtpZs0asWVQDNwsg=
X-Received: by 2002:a05:690e:16e1:b0:64d:6cac:ecb3 with SMTP id
 956f58d0204a3-64ed798167fmr2191116d50.35.1774357859823; Tue, 24 Mar 2026
 06:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774283146.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Mar 2026 14:10:48 +0100
X-Gmail-Original-Message-ID: <CAD++jL=mz5jOLkq6GA6ZWzfGfFnVOLTCoXKOd38YHj2UZaZ9ww@mail.gmail.com>
X-Gm-Features: AQROBzC_PVLEzvyq-VUAWwZR3Zdrlt3WKR3fyJ00TG0JrBVhIbhE3LyYep2gdCQ
Message-ID: <CAD++jL=mz5jOLkq6GA6ZWzfGfFnVOLTCoXKOd38YHj2UZaZ9ww@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: introduce a GPIO driver for SCMI
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>, arm-scmi@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34085-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,arm.com,lists.infradead.org,intel.com,oss.qualcomm.com,linaro.org,amd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 73AD430920D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 8:01=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This basically abandons my earlier attempts and goes back to Takahiro
> Akashi's driver.  Here is the link to Takahiro's patchset:
>
> https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linar=
o.org/
>
> v6: Fix a build error when CONFIG_PINCONF is disabled
>     Fix the dt-binding subject and my email address
>     Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()

v6 applied to this immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-scmi-pinctrl-gpio

Then merged into my devel branch for next.

Bartosz, you might want to pull it in!

Dan: thanks for your efforts to fix up the remaining hurdles and
bringing this to completion! Sometimes the last few % of work are
the hardest.

Also thanks to Takahiro for this idea: it worked out just like you
imagined.

Yours,
Linus Walleij

