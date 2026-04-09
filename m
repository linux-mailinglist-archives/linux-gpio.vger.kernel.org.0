Return-Path: <linux-gpio+bounces-34914-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKpkBC9W12kFMggAu9opvQ
	(envelope-from <linux-gpio+bounces-34914-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:33:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBD3C70F8
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72DC8301027D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAD633CEB0;
	Thu,  9 Apr 2026 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRkQilla";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ucxkfcmm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF934D3AC
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719979; cv=none; b=AljaqtO2DW9JPKRegq5xtOUvGSrEWz1+OImnqMN2/V5mT2nBdTVW3EUFsgiFS1zqbxEdnlUGJTE5s5VoRAtPmdTM5UpeJEIkcHUAcqPKuUEzqgDRfEp4T/P6di6sSQWw6InsgKFaf68DZFTWBAuiUILCrZR69qLxtDvAd3CO8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719979; c=relaxed/simple;
	bh=YQ8Q9WJzo2SFGA/zJrkAhf1el6CMe8GBBkdzr5Md+HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VjMplKeYyMNbFrwC6/5SWZuJPr2XXzrsnfvt8AjQ7r2nLOrj4DnQbT0Opg1kZ3gP5thM0/MyRzQq/1euWw59nMXFD38NwzwE2ZDsc/STnPLYm4cG+W6Kax7Jw6PcsblljDJ7aqLrdvwAiHn1L2ZLqd0Q20UjhtfxAcC2T7OTQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRkQilla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ucxkfcmm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397V7sY3781296
	for <linux-gpio@vger.kernel.org>; Thu, 9 Apr 2026 07:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgD5bqrasjwtvqmPPz9qZPXoeMDoQZtKSPGYgd+TdBI=; b=PRkQillajCJoSJz4
	9N8nmT+MMOBCHbHIB+8KLIYizxNChFKfX20oN2Sh1EEnhCpU/vZGqp5580ZBoslx
	wnrpa9PMTSLXlZ8S39LtUvNl83cXYV6IXqLpnEELRHZ3gAXGh+fxvyLC2dsVGOL5
	dxCsXrF+DINS0hg7uRbrqmaXhtArD92tL6cJgKSbkG9vs3yO8g4DlzqdtIL4+f5Y
	JLjniGhZJhXc8M4dWmdwEKQTzy6XNp3sEXhNcnR4VmfCfjWKo8doII1fKYRXBeMc
	YlfaM3lJnqnJOj2ZCoOkF2Ei2hDnjr4xpZzMHHUKPhh8WQPynFMXhQjRnEBvpjhS
	4GF3gw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6yaxtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 07:32:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d76f460b2so27016581cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775719977; x=1776324777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgD5bqrasjwtvqmPPz9qZPXoeMDoQZtKSPGYgd+TdBI=;
        b=Ucxkfcmmt1fOvEJBKvtD/WnZ2VfJBlW7oU5daAUaTDVoaF3KBDZT7IeTrerpXAB3/r
         ++0lLIOfWoIU82/Imjfd/oFrUr8balTL+rSivccTr3VdHs9E2UPzwNzd0HaCk6SAzmRi
         DZjczyy38L0Y2duIPftFgWwVGHe2pvv2x90CC/GhzbTSIVTGZveUh5ghrsZ4emDd1F88
         IZhnjGk9aD+xhGKTc5pw5drRwkTyuoqcDqzRXPJY8HrZ2YY0hxF5iHN6Hmpmx+Eb/1XN
         MEtfSxxk9RNcoAIj3fc+KsqFmU1PiRFLTB82S7YkLmvgAJK/HU95XUad0V/+aAF4x7zQ
         rYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719977; x=1776324777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lgD5bqrasjwtvqmPPz9qZPXoeMDoQZtKSPGYgd+TdBI=;
        b=ocKgpo9xwE23VjQbBYS5uRjZifiJkqRPH2iQUrVj5ufPcFHFDS6AyPa4opoOYAve+N
         utaKn1vvMarRJrDERe9xB4zlYqMCaZoXDeQXPGefCcOSvy5mgnO9duuiKysaVvaEGC2k
         bAo2Ab5N8EFhRRIVSsuhRj9QAdBLfGQGCYaVDb+/u8BeWCSkEbpKj/g25n7JxHrXqA9g
         nk4eBG3azXwJULMHyc7NZ2+UWZupcuv6HQeHdXSYevXiPeI3DCjiPrhTOU1yvrBUhVX5
         70nSTS4DpxL/UTDrxXtxBVZU1VrphuZB9qXy6PhLiFaNnWA1FcFed0404Vl5mxSdKnkk
         827A==
X-Gm-Message-State: AOJu0YyVlA6dMkr9BdKgpYEZmBMKWbCnaVbW0Xa9/pZNgr/7WVaLgqFo
	Zj7jfRYIpeSGhLDAwD+WWYhAR1HYKO2gYQdogxWH2BEPq0T/3gmzBwsoXDUIOC1PE1Qlpw57/ug
	D8SSg+SdoEDSV/JaboQ3VOdE4xaCSNQBb5RNhWBMeKegRQmC9FiskyGs3Ppv3aWxk
X-Gm-Gg: AeBDieveuhkB8t2yeNv07u2GlpEbcJo04Lc2CfUwFHE5TuQIryoGlUna7cNrQRQxQsI
	55B7fj5gxx3uLYfRR+jffZf6Ec6z1T6KTCYb8jLxw+RTDX1zO/ewIGHlS9Dg9eRajmEXTCfifCZ
	GD+69tNiZAw5ydhZnwwOx49gPwOJmhUI7BfqXK2cA/gHI7Xy5PT8Fw7/G+2GZKY9vQrDE/3HMlc
	jUBGV0erazZoudPwjokr57eSladWl6/0FRZvHkrVdt41WWxT3QC7RvaEDpLUhIUmbW0fMkio/HG
	kOG29qSLFYUeD+VU0jMBwiBE1YztT5fhRubTKCrHO7w7xOrTRWiXIbTUQzovKW3VG1bTULefqhr
	8qJ8j8fu78ALx7S3mDVY9WfoNm5Pwu5ErNCGY9MuV2thTgl1HXDQ=
X-Received: by 2002:ac8:5894:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50dc21db742mr37597721cf.27.1775719976800;
        Thu, 09 Apr 2026 00:32:56 -0700 (PDT)
X-Received: by 2002:ac8:5894:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50dc21db742mr37597461cf.27.1775719976321;
        Thu, 09 Apr 2026 00:32:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d4d1:1ce9:76bb:eea5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm69278152f8f.8.2026.04.09.00.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:32:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Date: Thu,  9 Apr 2026 09:32:53 +0200
Message-ID: <177571997161.4055.11075492714806891807.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tBvvuHvl6VyI_QqsW9JvA6LBuycYvond
X-Proofpoint-GUID: tBvvuHvl6VyI_QqsW9JvA6LBuycYvond
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d75629 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wFTb2tSE6c6nWfFG4hoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA2NiBTYWx0ZWRfX2tm1Rq6iHh5s
 AhtQGZiLOlANPO9z+K8/DtJcvzLftT75SoSSRzKNpACwZtg5B1NCE3+/5XLmCXQOAQkIVKitCFm
 s4udZZO9Kx5dfJ7tuKPSU6ZhHtIieDrxGbrCI6/00zxaxEObwggfrv4bp+mKQg4ayFKcaGuYkOl
 SVIxb7DEiw+Ni9d4QF/fWGD5mOAupT21FRz+RPi1W6gUIyWNbkiDbC6mNNysrZiW8UsemfPZecb
 YRnXmva8LQ6y/lHbcCmanxYqK2d+SrxZOqn8610hXulw62b+qyZZq0Uw6QgtGvyYbosxcq+hEzy
 /gM214HAR8j+qnibxbaP0gpZy/VdZ24l60zUkPttH5nNFsT8z8bU8QU7p5gBzi+F8dyTmZlMjsM
 FRMTYIW0EH2BhQqOccSDdCBjNqUpSq46bwUxN+G0GiG3bVkxh7zoh97f1t4Oc9AGXirrSdZ6z2a
 oTCKG980tE42/C/v8mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34914-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,proton.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BFBD3C70F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 07 Apr 2026 14:49:51 +0200, Bartosz Golaszewski wrote:
> This series fixes a number of bugs reported to my by a person going by
> 4fqr <4fqr@proton.me>. The report seems to have been generated at least
> in part with the help from some kind of an AI agent, however the person
> behind it is almost certainly a human (these are indeed weird times if
> I need to say things like that...).
> 
> This includes some urgent security fixes in python bindings and a slew of
> changes addressing less severe bugs.
> 
> [...]

Applied, thanks!

[01/14] bindings: python: fix heap-buffer overflow bugs on setting/getting values
        https://git.kernel.org/brgl/c/c6a76be56ce61f9267a84c2534634b435a7641ff
[02/14] bindings: python: remove duplicated edge detection setting
        https://git.kernel.org/brgl/c/a2c92c9ece231c03d15a7b4846779a8fd554ec0b
[03/14] core: fix 1-byte buffer over-read bugs in gpiod_chip_info_from_uapi()
        https://git.kernel.org/brgl/c/c040d4e15e5d4190895da5427db0a52b7457c12e
[04/14] core: fix parameter type in gpiod_line_mask_test_bit()
        https://git.kernel.org/brgl/c/27081075f3e28582d250fb38f361183ce6bf097c
[05/14] core: store debounce_period_us with correct type
        https://git.kernel.org/brgl/c/d1c60753e15106d1c34f5f5c12683e8db715c42e
[06/14] core: check the value of num_lines returned by the kernel
        https://git.kernel.org/brgl/c/641f54aa55c4337fca31414827e14511e6ac91f5
[07/14] tools: reject "u" as period unit specifier
        https://git.kernel.org/brgl/c/39f6239848f604996fd52f542300564e764fc157
[08/14] tools: fix an integer overflow bug in parse_period()
        https://git.kernel.org/brgl/c/6702eed1a5f2cec5b8df66151c438ed657963064
[09/14] tools: gpionotify: fix memory leak on every event read
        https://git.kernel.org/brgl/c/42697e4c6c79e376f895e7222af94b7010cb1d1f
[10/14] tools: gpionotify: add the missing return value check for calloc()
        https://git.kernel.org/brgl/c/ee0efc09f1b0000b57d681cd8a0e9def9f62f5b4
[11/14] tools: gpionotify: free pollfds on exit()
        https://git.kernel.org/brgl/c/da68c01be016b3225a9319045ec017d7eb0d7c71
[12/14] tools: gpionotify: don't leak info returned by gpiod_chip_watch_line_info()
        https://git.kernel.org/brgl/c/0de77e2abf124f3027b05d7c0ed8bfcab8e6a41c
[13/14] tools: gpioinfo: use correct function to free the resolver
        https://git.kernel.org/brgl/c/6e228ace2acbf161c57a0034f865472dc5993ef5
[14/14] dbus: manager: use the correct loop counter in error path
        https://git.kernel.org/brgl/c/aff7a6143bea49e26208986aaa21bc4081146942

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

