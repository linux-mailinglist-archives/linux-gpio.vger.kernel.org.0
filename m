Return-Path: <linux-gpio+bounces-35244-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL+4C2Xp5WnxpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35244-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:52:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E762428816
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4256302E871
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 08:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6CF388E6F;
	Mon, 20 Apr 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2x5KwLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRr85aLI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C440DFC7
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674820; cv=none; b=PpBcT29fzcvab18MJWHX/qyL7ub7YzOnk89EN0D368cmD/FUdgRfmorcQY0lxKQlN8WWk+dXwHajceU8u17vUIcucf8ntH5ksqkA9UMBv/GqRe33cNLv5Oz6PQVqxk5XrIu76K4W87gK0rXVN4YgZFnOeQc9ILVZ84raDr2B0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674820; c=relaxed/simple;
	bh=jmJMHCEDEqFtqT4DpJ/nk1l2e1ki14O4n3ALC32GUG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EU2ndhyjTjVKeaEgJox+uzudpDi2x2BT1FB1o7aX2M3ytUmBBZRAmr3mhzXQfXNbzGFQFjzbrjfkDoUqhz5nrKKCqZCxrrYBWoY8qrc4p+cAN7RSMkY1APXKJrX9Kgxy2dbL+xT2RiyDVJviOk9fzG8ArNDCP212tii9EMjkGpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2x5KwLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRr85aLI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7YrLS3455276
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsGYfp7eRNGsKROuN/kDYDbT/Z1WAXabwZxt8YBitwA=; b=T2x5KwLZUGMfI59w
	vwImH4L9HeUrBX90MONAzzTK7xaBo/dC9gEND02el36xuVkOPbU90kaQcEO/2ecV
	LySXX98L1/t0nnft5JvYTuFy1uv6/3USHGWuvfZUhy2EffvkIYhHBCT5yQ/W7a0o
	DZAvBGXrCeAVGK64qnePFhfwO7JmMJ5ggt+pAQidX0qwUg3jdue04CbgzDq90s5t
	s2X5DL1VEgBmvYbGq7imJ+1v6dF6SVt9AZMcWVGNmtUkhpLRLmpOrm1BWH4beE/g
	Ctm62mLnKRxp1lSsJae9bTYD5xeWIqeFOEE6A8hTMcZU8OUnGNtQaw6/crq3V2z+
	Tk85Uw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjrchw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 08:46:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d826ed6f9so86229121cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674817; x=1777279617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsGYfp7eRNGsKROuN/kDYDbT/Z1WAXabwZxt8YBitwA=;
        b=TRr85aLIVUKhQQ35rkyEbhQNO6KQWMLQKquVm6Qddyd4qp+2iudXWj0+px4v01TxKA
         mFSXToL2ZaPZ05f37bWXqUsFoJ4Dx5y7TT86pOl7+eqqGeN3tLMcZDZHn3ECv25dpT00
         8uIQ/KPYraSra0byeEm6lJNLaUBql3DIRSOR5udoLckrZbKroGe61v8DForbTax1o5pb
         bWW1MseiUBJjJTrvglAh0Bn5do/RH8b5UJcQLuTZYofpmsanm8L2nCCboKMNnzvImBUO
         iG1+OZmVP9y8yrYj20FkDrqulvsF2McPd/IiZsWM+M6xWXkBaogszJqPJz/2KgAXlmMO
         wSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674817; x=1777279617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KsGYfp7eRNGsKROuN/kDYDbT/Z1WAXabwZxt8YBitwA=;
        b=kqRP/zy82t2rhwvPAvjJQw6PZGFbSOeBnuir9EzrjQmOhX3tccr+KHuK6pR07yGbs6
         5R2wIcGOn8LkR5Nl6xQ8huG7t8bbBUNtDz7LQDsBB+E8dHY/dXcRe0S2EgMAFhWVbGx0
         Dec6aeBqwy+ONjGUxhWDtxLLBHka190X2A9FsKDiaCUvqkyZWWOQsKu6lB5xqSVvcvO/
         AzQD/7LcsKeVDI/Fw9OwLhu//MjuR/0Ig8x4rwqTfRmjJEKxUo5W5Qno2x7IC4tCq9PQ
         Bo6c/CTsicl5/puqq/yxgGYc6UMuL0El1UwRGBdRqKqlklAnIUNj9rs7JRPB3b8CEtn+
         /B1g==
X-Forwarded-Encrypted: i=1; AFNElJ91qiTTdEWKexsDWnmZxp+NPjKFrQP4lffKq1LBGgWi3cWz7TG4xBdgIMfwqt9cV+lzZxj6fbSa1X8v@vger.kernel.org
X-Gm-Message-State: AOJu0YyT2HFfu2okC/8KfWJVOUpoNfpFBvmki0H4WVwlsYCAPc+Gyu5w
	tIX+xisCkn7SXROrSyyu6vO60WrLupnZH+bjdw9OplsDjUXWc8FOEOZ9j37uRy8ybJRLQh0ZaaQ
	+FPqE2kAADZygjL8zCx66Ul9q+xx3tA0MH3lkvzUayp5T2Apxnr6h1OPJcOxIvA2x
X-Gm-Gg: AeBDievAksZCy5WfWsR9eqwurHQdAetvu3qRP48UoPVm+r4nszz23z09oITxk58TwAG
	aqsweLeOUv95wy4TpL1nC4jce7A59mAJo8Mu4UwR/7YG72H/EVUuRoiboK7UyBwWT3fs7FewuzP
	yuNx+tbp7cZ80ZpL5gfBykNZHitzX5OW1pDgGaSYYxZ/mlVl3OQx41WLPumg8g+aEtTWSoirGqA
	cFR6Kiw2f7gj0Ka/nTsXPgyUJpOlP0tQqWzg8se3QTBr0KXkgc+EP1xa5aP9EeYjgNkJ8lyeWSV
	x31usMpWXlpL2pOqtwIIUf15sJDtZ8Ki0Y1NjdgeIiVwnYgrIXbknWnKcpD3Oety0PXRHUyNGSm
	XXiSlI0W6sQfIWYw3RIVD3VQV9PAiE83xpn1tcEeBRcP4YAhBEQTnZRjioHY=
X-Received: by 2002:a05:622a:a910:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-50e3665175dmr118064581cf.16.1776674817161;
        Mon, 20 Apr 2026 01:46:57 -0700 (PDT)
X-Received: by 2002:a05:622a:a910:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-50e3665175dmr118064471cf.16.1776674816737;
        Mon, 20 Apr 2026 01:46:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:776:c20f:3f2a:49a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm36712993f8f.36.2026.04.20.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 01:46:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
        Jonas Karlman <jonas@kwiboo.se>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
Date: Mon, 20 Apr 2026 10:46:54 +0200
Message-ID: <177667481191.5684.11286552597215821404.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416154928.2103388-1-jonas@kwiboo.se>
References: <20260416154928.2103388-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BcOfteReRz4Kl6QLBIzQ__65uKzMQEVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4NCBTYWx0ZWRfX371OjzL61bNb
 TR2qY+I94lLc5XAsLQE8Rm+lXJf8RwEb/d9IFu8GXXqbP20S9/hn2Alk4C9Zi6MTuvMPV6oA5pb
 ihKmucVgWUrfanzMJJ0wt3NUu+2hMB9ofT/h+QLRB5HbJznJHjnFkYXWjcoCxDUihdWBxWHiDve
 cdPwUEDi3JpwFbJY+6WfWbvjc2YJpivjm6yRn6MlEPD+SRIHmqhxx74SIAXdUsfWTqob3lfYi5L
 U4nZK4NDo16SuSA9aIT7KNFROi7lTYBRnREa/ceVfkfKoybYj4IZ7UwFdsj1vYNfub9+DSOCDrS
 DnXxRXS9I7oZvwddX98qlX4lW2Zs5QTLj57g3guosT7CgjlwyvdUtnEGxmQ1WjLDbKL0bVhhSH3
 /H5jn3H0/zFSSSdP0h46+3Evb9YEQwSLn3iocKLsz3/KIt6PgEANpsKL1CC9qT0Ykpx7f4lj8wH
 tK6t1UJbpk2dCKTPrYA==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e5e801 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1kTrt0XSjUtm7xzPXtIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BcOfteReRz4Kl6QLBIzQ__65uKzMQEVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ff790000:email,qualcomm.com:dkim,qualcomm.com:email,ff780000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ff788000:email,ff730000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35244-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E762428816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 16 Apr 2026 15:49:28 +0000, Jonas Karlman wrote:
> The commit c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base
> allocation") broke GPIO on devices using device trees which don't set
> the gpio-ranges property, something only Rockchip RK35xx SoC DTs do.
> 
> On a Rockchip RK3399 device something like following is now observed:
> 
> [    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
> [    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
> [    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
> [    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
> [    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
> --
> [    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it cannot be requested
> [    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:637)
> [    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/led-0'
> [    0.212389] leds-gpio leds: probe with driver leds-gpio failed with error -22
> --
> [    0.607545] rockchip-pinctrl pinctrl: pin 519 is not registered so it cannot be requested
> [    0.608775] rockchip-pinctrl pinctrl: error -EINVAL: pin-519 (gpio0:519)
> [    0.610003] dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -22
> --
> [    0.805882] rockchip-pinctrl pinctrl: pin 547 is not registered so it cannot be requested
> [    0.806672] rockchip-pinctrl pinctrl: error -EINVAL: pin-547 (gpio1:547)
> [    0.807301] reg-fixed-voltage regulator-vbus-typec: error -EINVAL: can't get GPIO
> [    0.807307] rockchip-pinctrl pinctrl: pin 602 is not registered so it cannot be requested
> [    0.807970] reg-fixed-voltage regulator-vbus-typec: probe with driver reg-fixed-voltage failed with error -22
> [    0.808692] rockchip-pinctrl pinctrl: error -EINVAL: pin-602 (gpio2:602)
> [    0.810279] reg-fixed-voltage regulator-vcc3v3-pcie: error -EINVAL: can't get GPIO
> [    0.810284] rockchip-pinctrl pinctrl: pin 665 is not registered so it cannot be requested
> [    0.810299] rockchip-pinctrl pinctrl: error -EINVAL: pin-665 (gpio4:665)
> [    0.810960] reg-fixed-voltage regulator-vcc3v3-pcie: probe with driver reg-fixed-voltage failed with error -22
> [    0.811679] reg-fixed-voltage regulator-vcc5v0-host: error -EINVAL: can't get GPIO
> [    0.813943] reg-fixed-voltage regulator-vcc5v0-host: probe with driver reg-fixed-voltage failed with error -22
> --
> [    0.867788] rockchip-pinctrl pinctrl: pin 522 is not registered so it cannot be requested
> [    0.868537] rockchip-pinctrl pinctrl: error -EINVAL: pin-522 (gpio0:522)
> [    0.869166] pwrseq_simple sdio-pwrseq: error -EINVAL: reset GPIOs not ready
> [    0.869798] pwrseq_simple sdio-pwrseq: probe with driver pwrseq_simple failed with error -22
> --
> [    0.940365] rockchip-pinctrl pinctrl: pin 623 is not registered so it cannot be requested
> [    0.941084] rockchip-pinctrl pinctrl: error -EINVAL: pin-623 (gpio3:623)
> [    0.941823] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: Cannot register the MDIO bus
> [    0.942542] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: MDIO bus (id: 0) registration failed
> [    0.943772] rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -22
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
      https://git.kernel.org/brgl/c/5cd9c6d332f46d1de8b68117fe2a3f1b08ee80ff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

