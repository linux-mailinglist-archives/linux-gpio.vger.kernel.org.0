Return-Path: <linux-gpio+bounces-27176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40966BDD3EA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 09:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 171BC4E5CFA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 07:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389CE314A8F;
	Wed, 15 Oct 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b="m+ZPnW50"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.commetrax.com (mail.commetrax.com [141.95.18.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CAE304BC8
	for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2025 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.18.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514992; cv=none; b=UtmIs79KdvnPLbBbgsFNFCqIAC14l10QC3lE6twMBskRYX1prqcKx/x1KzLcawo9k+85lJozanzGtlkLuIq8jAxYjXw+Vu7HayvyuVbkqvv0djivG8rEsOcP5YzdFFfr1paaXhfXPH9P0SYIsuraQgIa1qaGXOJUg77dJf8IBFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514992; c=relaxed/simple;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=koNETVcdKT57EVFjMCUDlxD88wUwDebeQI1rW9cSLe9HIlNWRgzkc8rBug5GY9wVv6uVZNLvmO6cvswrVgiHxju8dDMPSiNrqNkfFfTHw+ModlSjrG8kcBNemAzdZrOIQKqWXmCsu5jIhKba60prEyJZqbyl+ji/Ig6n9X4dIQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com; spf=pass smtp.mailfrom=commetrax.com; dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b=m+ZPnW50; arc=none smtp.client-ip=141.95.18.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=commetrax.com
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 3C09524866; Wed, 15 Oct 2025 09:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1760514988;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Date:From:To:Subject:From;
	b=m+ZPnW50lrCSQQObg3jE2/UzWaFJMJM3XrzleYJjVGKXtYP3VNI1edUJWx0bOZJvi
	 y/rQLqr9dnN0LiX7Xd47RNzQZeSTO3FdDEC/14EbtOMx7uLYMjcHGG1cROjhSWK/XR
	 ZXOqUiTdvY6/LkpbBDiOMVfMrRsSd/13W04Y+KwPpIWXQ2f141kp1rKG4h7iLxSFIx
	 zCFlUrv4CGZFxYrqHMVUzwiM83EWFBXSvgUhrPEX/+7hLtdgVDqZN41Wz6Ag3hEKap
	 THQevsAP3sRbLzaBIaSZocNtykarC4FOx6z2Ooh/yvGzdztszYjA+JFDIzwJyyA/9E
	 47bqgYfYvtiMA==
Received: by mail.commetrax.com for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2025 07:55:50 GMT
Message-ID: <20251015084501-0.1.ca.16x7e.0.h7ygie11ky@commetrax.com>
Date: Wed, 15 Oct 2025 07:55:50 GMT
From: "Luke Walsh" <luke.walsh@commetrax.com>
To: <linux-gpio@vger.kernel.org>
Subject: Welders ready to work
X-Mailer: mail.commetrax.com
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

we support companies in carrying out industrial projects by providing wel=
ding and assembly of steel structures =E2=80=93 both on-site and in-house=
=2E

In practice, this means we enter with a ready team of welders and fitters=
, take responsibility for preparing the components, their installation an=
d quality control.=20

The client receives a complete, safe and timely delivered structure.

If you have projects that require steel solutions, we would be happy to t=
alk about how we can take over this part of the work and relieve your tea=
m.

Would you be open to a short conversation?


Best regards
Luke Walsh

