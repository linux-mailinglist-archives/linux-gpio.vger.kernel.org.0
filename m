Return-Path: <linux-gpio+bounces-33468-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICXqKlrJt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33468-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6997296C71
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E09BD30028DA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3343A38550E;
	Mon, 16 Mar 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3LJhf/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNZz7r2h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA534B186
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652303; cv=none; b=cfTk7lxk98AeiI/DcH0WnMhixMBYnONhaX/j9UNwLAW6GX70WDvO2E4tPAU0RMf7sr3YFe6pTsqMxdtXV3RZmjCJgmT5EInP+FQ52IMcPnCJ8Rc0JpAWVVE+rPzZlH+8QYriPoqHjc4M4bwND76gpV5QayoUKfS/4cpbVReLMyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652303; c=relaxed/simple;
	bh=11klVLReDY9MpPLzc3C6rf4vBe6cNVY7G3XPCRDDW8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJpiGBjtO4Kl6swmtB/FihhFoTBKng67H+0sYxauhENHax9viZ5RBOAzFkY7E4JLTKJNy9pU0treNnaK3HqoWD/VvzO4W5CcuCREWYOdfQYi5eO9L1NFCdbxqfdbX6O5m6QQSn54j++sJqJzqu2ONsk5O+lnkYj384vNb89ptR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3LJhf/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNZz7r2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64adR3777629
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iT6cmn0za2bl4hE5ySeB/tSt5xfH0OVjFY6Bnd9Fdw=; b=m3LJhf/wSXrCG8kr
	c2QJm6Y+AoGSk1+6+woX01GN2syd9SEP3RL6+PoCpjmB8y05k9bZmjAaMQNzwzYB
	Ntlw1uzrv+8+lW5HrOAGgnMkyfFLfMzZIfJhQBNETPLDIVADmnsqnRBmG6nj2ymr
	c8xrd6PkcQXZ1MYGJPNZCTYleJr/7HGhd240+I5Dyb3oHnqc5sXtIMtEaEV3CBeI
	mZurQTHfrCLJ1Qb+37W6pjRkCSxmLPXaGIEK4PG68FETi+f7gDYzNBY6ji6o5XNa
	fXPepH1J6KzB2ZOoqiiOhbo7Q6Mrm2md0q8FL66574eSJgmAEafO7Jc5MLGROv6o
	hZ0rLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vutu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80bea54dso2768863185a.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652300; x=1774257100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iT6cmn0za2bl4hE5ySeB/tSt5xfH0OVjFY6Bnd9Fdw=;
        b=KNZz7r2h+kuxspxYb6bLxoL3e7+T+8NuL5hVPRlbDSqUawsR0HFGZXtyQff8sb2vxG
         hEx9TWjQo8/NQ054HxeC2R3ifTYhyyOeR++W/Y3BRJ40mN3YV2bPs/rQICzkuHxGsyCN
         3YczJnd6CgE+qzj7u3HK+PLbRoJ6GxMK0Rb4195+NIHdw+3ZMOtA/xZpbJ8Ovk0A/Eos
         fNI0gd2xDtlsyCBO5AjX7qAEYTjsXJ1wGgj6ogICuBu/cBv9c+d6v3Jw8IqNB7nd85Hi
         U9T4SA8lSqBA/Tv3dCbBjiNNP1jshgc/OEMC5OsbRhxhdyy3jnJ8oEW9i5aLISaTtuRb
         uYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652300; x=1774257100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9iT6cmn0za2bl4hE5ySeB/tSt5xfH0OVjFY6Bnd9Fdw=;
        b=NecGxneT5OQecHtb5TdZlC1TxRKL+6TCmd79GXZGn/TSmGteRKPmGiDcATB/lyiXaV
         Y2SdM7TEJsFCBYfS1EZFOr0Nu3zmEXHqRopPYuHmj0rrPQxkS4xLt5bJAcosjSqij9zB
         iXX+zCWUDy9iDJGaTdIKayGl/flasFshyWtAN4ZCC2KAJh83ydNw74MplfJQFY57DrE1
         ewpZj+u/agWPGW4GiH3nz3D98CxuKi2Wdd7qmCBjXGJ8zBEhCPgKqWTyhxeSLOj5UEHQ
         74BDDNSNz4J130XRFMdPYdIPTRtf7JbW7f3fTGdF1dl5PkI5FITetFy+x1NPBYrU1rvi
         ublw==
X-Forwarded-Encrypted: i=1; AJvYcCWidGOdcTGg1NIEPG+HgTS8DGzh02VYQLdKyc9jweF6GVQYAAlBvL4KHDV3b6I+gf97dglyCsCrZG+h@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrukUVqAmQlrwz4/+O1tNhka/jBu9nbrF3X0dLhK9SB75fGCd
	6BB1fGkpnU//3chZp7GmGy7gkStbp8O6NQrRjb/45PqKdfXCM/CHVXtmnQMXTS+2m/Rv8FomGr/
	k0mcPPcvl5KANiLE0eCisxoH/Z+/o5Ib1UEcrcozYyzbYh6oDSucc0tgZ4lgR/5hDpR0PMA2O
X-Gm-Gg: ATEYQzwuCQzbIjcxJ4qHhGKDBiuB8H+UsWYUAuDfsTXJF5bHU+1niqErGuT4b2JAxSP
	nhOdT8ePkxC410eZYy2QxPYBWcz4fDy3aFD7nUeNrR5BarddZM9I/8ZRyP++jlNCT6y0NBcAoY0
	w8MfTXKJDMRG8MSy/tGpTzO78yRnTySey5DrE9OEEwcoNG32X44VfnNJ8PZX3vvyhZGqBaPrsvb
	u3QbN88Ue5khHLvTJfqhrfZ1Qmmxt3ViYg7xsuMAKiWDfNGGzK9Pq2rIUcUZ9cRVuAFk7hgtW2R
	/QYKhG7REJsS0d8k9whOcvt4Rz7di0rpRSfx7BugKGiyhfGjvephooy7XPu8de9RbLC00uk60FQ
	EUgRoJDeSVFx++Crqg0a9AGSudkOrAdg7wCCQU4dMEuap+KYqldU=
X-Received: by 2002:a05:620a:6cc2:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8cdb5a63224mr1586624985a.19.1773652300223;
        Mon, 16 Mar 2026 02:11:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8cdb5a63224mr1586623085a.19.1773652299813;
        Mon, 16 Mar 2026 02:11:39 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Richard Lyu <richard.lyu@suse.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: max732x: use guard(mutex) to simplify locking
Date: Mon, 16 Mar 2026 10:11:23 +0100
Message-ID: <177365228184.54363.4868607544360268711.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311085924.191288-1-richard.lyu@suse.com>
References: <20260311085924.191288-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HKtqOIGr3thN2pkyNkAmNCPvIG8I-Qm8
X-Proofpoint-ORIG-GUID: HKtqOIGr3thN2pkyNkAmNCPvIG8I-Qm8
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7c94d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W9-ZMoRfUtoBgr4Nie4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfX+7pwPvdEqZGy
 YCE6yCECPPEATXPqEM2caTrM6F6NZQT5j/VRs6avUt5irdO0XUuh7TVdm+au7Hak1aVdP8RWzPw
 O//ia5ZHmkUeetkuKHVG3VV9cTOf32/YmjFo/7Fgs0gP5b+A/yKK9tMyWvT4vC/MA+oilwmOb84
 Z4E3ZPHl6RddlJfbJlofWqgf81YdibMoJXP1hCTB6YozSiinmZxQv1nV05ynW3KYuIfpAoKiXcE
 oKOpKu8pbilelij1uGHcQfY05xYZKvTKGQ2joWnksYI/mok0bSlgh9i9kVq7MDbe4PbpUpTlMQ3
 qMw7e1z2Jz9zvqQ06P5qrI/Ub0x3n6tDGz/Rtfwgwgkpf38Bw823sly4XkqTMr0wuBm9PbiwkAc
 hKtrFxER8MBd57n8wdJtBtEhWne/w3OOvNRBeIWQTPYBEtAwk2idvDpxcDw4W/O7lxmphxbu0uJ
 U/isxgZ/IHqD+WPiiGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33468-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6997296C71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 16:59:26 +0800, Richard Lyu wrote:
> Convert the max732x driver to use the RAII-based guard(mutex) macro from
> <linux/cleanup.h>. This change replaces manual mutex_lock() and
> mutex_unlock() calls, allowing the chip lock to be managed automatically
> based on function scope.
> 
> Refactor max732x_gpio_set_mask() and max732x_irq_update_mask() to
> improve code readability. This allows for direct returns and removes
> the redundant 'out' label in the set_mask function, resulting in
> cleaner and more maintainable code.
> 
> [...]

Applied, thanks!

[1/1] gpio: max732x: use guard(mutex) to simplify locking
      https://git.kernel.org/brgl/c/8a3613898ff3b7eb9eed252f41aebcc1d7af4a31

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

