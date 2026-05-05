Return-Path: <linux-gpio+bounces-36131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMrVM8i7+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:43:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 728754CA01A
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E510F3085CC4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84153290A9;
	Tue,  5 May 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxDotEi1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC1325704
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974010; cv=none; b=Y0rHsv3zRh8l662Uj+Or8zH/tI8XaesAjtPYJTMhJ/j2KlZmgd8F5yZmNcrqeYflotlxJy4e2Np9nEbrOFhl/mIW45FngfWvLZyLnp2Ot8qBE7IOzFBM/iQ+rTD1hQpo4l/HZaxSWGhaSVr5giDLj741ZNLGTf+tUwKvRG7PPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974010; c=relaxed/simple;
	bh=1QrPgixzOyYGgtnLe1EBiZ38JsCWMihHn7W6U5Xl034=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1EfLLdWMlwxmpmHMv+h6JkjyuW7jpIG88+Z3ljHCA0US9t08eMLSC3HOi47OMs3j5Ypf9W/adwsfLZFlF9/yFVAAw7//L4S3Aa/GqIytGGvrNvBc5LJRcJHkPnL77XdBySBbekO66n81OxWOrcUUpEw2oPh/iSXU7Tr+lCBCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxDotEi1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F56CC2BCB9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974010;
	bh=1QrPgixzOyYGgtnLe1EBiZ38JsCWMihHn7W6U5Xl034=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WxDotEi1ytWQaHeLaBcLOSFwmM8Dc65+ZBHFpHFh7+TkKeDFwbUi9/2ElYF1r15Jl
	 CWN+M8SkFE5ZQI1jvPoGANYkm87zfhD4POwT9Erw/JrF0Ai0Z05XGJu8+G88bmSu39
	 bUH/tosye6EkA/i6OMJmeQkIwtfDXt7wwhR75vzCYBHCGGdk93kHCLNML2FTug5jR1
	 ac6F5QH4ljIew6mb8PeCba9bUrsMVf4wL7SGY5YrvlZiUcQi+20t0ngFv21Qif3zMF
	 wqxka9BpvG2wlCxyCWP7sWoJl3QDs4GtKiT8BTLhOtV/9Bv7jETTMFWBXvwr6jC2r/
	 YtuqhzbLOzJ8g==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so5473204e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96XHu3fJDXzW3vAm4uI3WsYNdmsIxQJI4AI6X2c1eZ6Wol9eVJ0UaP4WvuWR0N4MQazetfo9PqpzuK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp1AO35sx3gDYgtt6MBRIUNw/9gFOX+cP2tKycEQNJv92oInpz
	MKSP+mko3q2P31aVyiLDrb/5B3uqJppb5oW0ZqX4jWqIyzDkq4UidXjmBdQY76/ik9tS6BLwy5J
	iLdXgbvknN8XnJx/MROvPqSf8Bi4Gu+g=
X-Received: by 2002:a05:6512:3f15:b0:5a1:d352:a49 with SMTP id
 2adb3069b0e04-5a8631c8161mr3913568e87.41.1777974008860; Tue, 05 May 2026
 02:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
 <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx> <372e9718-bea1-4f20-ab86-af6f56299e75@oss.qualcomm.com>
In-Reply-To: <372e9718-bea1-4f20-ab86-af6f56299e75@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:39:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnaghWu-TKLtWqN7zukr8teiK=ZnuvkrGzzAJrLkFu1wQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kjr3DNdqnSfP3Zee9xjSplW5fYuLg2_-6hVxVBn-gXNo5J75XudvGMcew
Message-ID: <CAD++jLnaghWu-TKLtWqN7zukr8teiK=ZnuvkrGzzAJrLkFu1wQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Russell King <linux@armlinux.org.uk>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 728754CA01A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36131-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 8:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 28/04/2026 23:13, Dmitry Baryshkov wrote:

> > I think it would have been better split into 3 patches, but this way is
> > also fine.
>
> You mean defconfigs as separate patches? I could do that and I was
> thinking about it, but many people do testing with defconfig and such
> defconfig would be nonbisectable here.

I read once that each patch should be "a single technical step"
and in this case I would say it is one technical step and should
be one patch.

That's why I just applied it.

Yours,
Linus Walleij

