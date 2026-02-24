Return-Path: <linux-gpio+bounces-32111-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLUrDMFnnWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32111-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:56:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15A184188
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C9A430AAE68
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0820C369214;
	Tue, 24 Feb 2026 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufHgRo1c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD636920C
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923246; cv=none; b=ZhJil/tYc8vX4ZMFrBgcwrPCSVjXu74IgxBoqBYngn3oq8t48sWWpK0BXwtkOdDwZL5r1SUBQwuKyzIwvJMa2DTenONVlNgpwl45YtTi9zgTu8IVOI16MmIw41Aerov4GwHT0lbVKsI8Qdib2w/pAzoAWGJwGOUZj26emngU9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923246; c=relaxed/simple;
	bh=pVX1ZYnnouDs16u1mbVNj+29npernRhqQsjhcxSMdAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvC+Ik1X6Ds1/o896aNKsyNg/G3AOhCY6dAeTIXnN0hfaDF4mPlhJoivhgpiD+nqpeT8DTPzMAZ8447aCtOB+igTTIIH5aPAUbkvh6gPFNCgn70tYsCpb8/KomEALn8/vhIQszwp2vIbrt3I5TIVd9NcziYzIqrRCzyGYZv5bcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufHgRo1c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A0FC19424
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923246;
	bh=pVX1ZYnnouDs16u1mbVNj+29npernRhqQsjhcxSMdAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ufHgRo1c7/ln28c7qVmF3w73I5qXkLvGDIHIGb60EmJfOdjXRhrL5I4I6dOZKkkv0
	 ZBeEcqSZ1uFMz9ktQWxcHznquVH7ua4rBSfVGcd/AGYMMrt/fGdROzEngYh1YC+qPL
	 g4XONZD22PRcwhVOPO4tAk9Au28o3K0ARMw05k++NeO7+8vvvjfngavRYAfWWS5iKJ
	 ddilWsDWbKO/hZzXgjzfVkO7Of1UeUeflKqzn8K/S3q1hMXWmZJ7LR90GmxZBzaZm9
	 bFjawi5OVq1RXEgNCKcouu/bhM0wRASCe8WryaCAVvq1nKba/BOsxLbkwe9BNAYaqs
	 GwxDZPuYnOnZw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79801df3e42so63670317b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:54:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmSyCVRV1PS47eVlX2pDAHfuzg1axrIQnBvDYBqJCIktwH0Kt+H8mbquIK6dN5q1YbzDxyT3Vg8YWO@vger.kernel.org
X-Gm-Message-State: AOJu0YyZO3YLZ6Im8NgJ6JpfbrJrPShKlP7y3LmwyebRat+OrdzhzMiC
	L/48/HJM+xUZLsGAiZETLG92JMuLI1/d7L5NsIdSz+bQkPh9LugW2yGoUXvOTi1HDtoHoO5C3k6
	TVbtDktudNeYl2U/4Euhj3DUJCpJzpts=
X-Received: by 2002:a05:690c:c527:b0:795:905:c047 with SMTP id
 00721157ae682-7982b69ae0amr91228817b3.3.1771923245809; Tue, 24 Feb 2026
 00:54:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216082549.32853-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216082549.32853-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:53:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLkUGfrd92oDQfHHS-gYZZi7_Q43C=FMO3N24n0CF7zECQ@mail.gmail.com>
X-Gm-Features: AaiRm52cmKd9h0ZxEo0fWbA1DJUtP3-u1qiLHB_kIL2Z9fJH0_NKPmojO9fU6Dw
Message-ID: <CAD++jLkUGfrd92oDQfHHS-gYZZi7_Q43C=FMO3N24n0CF7zECQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm660-lpass-lpi: Make groups and
 functions variables static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32111-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB15A184188
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 9:25=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> File-scope 'sdm660_lpi_pinctrl_groups' and
> 'sdm660_lpi_pinctrl_functions' are not used outside of this unit, so
> make them static to silence sparse warnings:
>
>   pinctrl-sdm660-lpass-lpi.c:79:27: warning: symbol 'sdm660_lpi_pinctrl_g=
roups' was not declared. Should it be static?
>   pinctrl-sdm660-lpass-lpi.c:116:27: warning: symbol 'sdm660_lpi_pinctrl_=
functions' was not declared. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

