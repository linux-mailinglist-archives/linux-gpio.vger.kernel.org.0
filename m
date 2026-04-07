Return-Path: <linux-gpio+bounces-34792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NcwAPv91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC13AEAD5
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4FF8303FDEB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FBD3B47D6;
	Tue,  7 Apr 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FySCNTjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="he96+y0M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07D3B4E80
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566282; cv=none; b=Ro2vuve4vawewrmm3rpfqLPWsHe6ZjEdbpB7nv9f6vf2k5367Ew2v4fqjeT3Is3xa9H9KiTMSEVHt5oHYaAl/1MKYMaGfNaru06SWSoilXsOXgJLkeBMbDnKxNluglqWMg7tp/fkdOsriyA2ys2pHU4LSGh1UMPlwbJfuV6iHnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566282; c=relaxed/simple;
	bh=jYYVjrH7BY9ckl7etwNNoXqqeqZmp7OMnex0ZNfKW2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nngIP0nXxaCoaymsWhkM2QXLtGc74d/r703HWNX+yL8Rv0h+C/bTha+OHFpRpoV99lWhSecc6JlWpvWTZQnQrj7XXxgaOZ+fRmrRZwKsdslwKsbRFFAy9cWylWZcOi9k982q6aQVXnQvCuVGyV94S2GTOZMnS7njWI1QNaaNpWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FySCNTjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=he96+y0M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CiZYE1403543
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gM3TnJpCTBIlrfJ+/TrGRcrDZpcMhWoGmCdELO5pQag=; b=FySCNTjP6nxLklB4
	YJVn4MHLnQqQh8fcSYrMWFV177kqK4EGKSNTJFxmIv4ckDD0LAyNz3hgdSk7O5tX
	q0NnBGKzGIxCGqvPVFI2a9TAKCKSA3w3/Hs3nMCHIWUnitcv9JjsRAzwPJq7lTXx
	jv2F8Q1mzdk4TdgW2MJA6z9dcz81cMEnsoIuR06dOMNGc567pd/vtERqrcli/q+B
	rAhFaDfSi1pxDbF6ND5kaKOeVygXH8+ru6tK1tNCdYi5QQfFweSgafzcHJJ7a9Tn
	I3/IpL3xWDdRCkQ0zDfzA4p51i4T7JUWOjfz/rTCn1/h3ra75a5owZNcQNuJI+cO
	yWlPjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8as9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso114192451cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566280; x=1776171080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gM3TnJpCTBIlrfJ+/TrGRcrDZpcMhWoGmCdELO5pQag=;
        b=he96+y0MK/mgeFw3wsP6zkxJrK6r5b2GhatRPtMsnPPnbBALfWCqsj+ZCRuKjZ2PFw
         lpm8To/lCkLUqBtZrggAYGN4GuL097jzzA53U1e8Mz33KKlWxLI3E7b28Sz3my49qtod
         AsYD8pVe6Is3fzEsjXULRD8OEz1v5kCg4YBjTfcdp22rcmCI96onozgLCQCvvHAV+mI0
         AjFx4jMXibOrh/LKHjHvWF+WLNwf0qXUPD/Z7uTGYWHbSmwUIqigBbOjpYNcxa/qBRg3
         KXztFFhvVC4Rlwn1ZH2A/Le2TlvbGMnvoGnCpr6zJVo7ZSEujmNr3o+fWsNtbUnV3KTv
         SHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566280; x=1776171080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gM3TnJpCTBIlrfJ+/TrGRcrDZpcMhWoGmCdELO5pQag=;
        b=KBjFTBE5asXLtXtoaOMn8Mj2GQHzuFElTinfAOwozAKelDrKgN2CqZ2u0QaYiEAcVT
         YqBG6rBchMnDH4seveOfA0tRDaqMezb9WZAiQgSxtuaYO53JjW2K90V3Ya3NrmPCfclz
         de29kNVk4PmzBSQ0GvPPu3br+cy18P4Lg6xRdDsqL8wFkwBmDpgASiH5vHYOeXO7iGNv
         bJXMUzvi//OCGwdcDxY/lCTArSQBOOG+2KProUqYjZF7MWItobZarf7ifICDkxtcdbIz
         +aAxRQ5w32vOcysWp9rIN0qykJrn2sn7XnmAZNJrbdSyTVW9lbg4SeUUNoXdp2L2zjlo
         fs1g==
X-Gm-Message-State: AOJu0Yyz9/y80Kjmtgs76RUL5uBmKEzXgXqrsCEoBDPFFOG+dloZCfAn
	xbxdbDYN+9T1mOy7QouUGtDZcRKR3Ge/1gCdtRnBqvvI3oxl1c1Op/+x12RrtXlWSeYVCjRHopx
	c+Qqsf5EVIKRs/tVym+RpFRzvMMcjk7bsuyQadg97on85aWySYqvQCifjZzqVWrgF
X-Gm-Gg: AeBDieuF02YL5Mf9y96AEyxNVbEXjcQ/8elCrGN7b5ywwBJB6EJxFJjtSkcJ/WHrfDu
	KjEPPaADVyJXikHNNny/V6eHsiKAF7y/I5XSyWiWkcj0q9Oj/IrvRP4aQJttjSmUdfrEGqVFhRP
	wJr4F0FGDcZOWqKp4hTr8xdD66+1YI6/jhkNM0zXhcR86wqBjniF1t58Aw0defaaPAztS9n5uz3
	BQ+ZtQ+IbYu6myTO179lRQFd1Te0yyxN+bTW1gwZxa6g0K7aGd8SLHENCXlFL8WGdvBVcS2N01T
	ZFKaSZrsI9q6xn4WVhtilOPysFyfAMNT33XZ/DEOJf2VMVjZhAxW6I0EKOgXcW6LalUanmCvNyl
	kK7KCROywIwI0pBiCNd88wi85s49Ncf8fD6CDJatsRBbbJcpDnx4=
X-Received: by 2002:a05:622a:124b:b0:50d:a6e3:ae1 with SMTP id d75a77b69052e-50da6e314d5mr23052291cf.17.1775566279651;
        Tue, 07 Apr 2026 05:51:19 -0700 (PDT)
X-Received: by 2002:a05:622a:124b:b0:50d:a6e3:ae1 with SMTP id d75a77b69052e-50da6e314d5mr23051841cf.17.1775566279172;
        Tue, 07 Apr 2026 05:51:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:56 +0200
Subject: [PATCH libgpiod 05/14] core: store debounce_period_us with correct
 type
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-5-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYYVjrH7BY9ckl7etwNNoXqqeqZmp7OMnex0ZNfKW2c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P23XY0Q/kytcLqO+PrUSIWt5fBq5AlJeYHsX
 cASt0zOW0+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9twAKCRAFnS7L/zaE
 w+RcD/sHjU8P8p7eMIB42DU7gq49m9D5cURcOi3nt3v2H3a4WUYj3ZdVQQpNsGBtGQGQlEPKtTW
 6WuYl+B40QMhR828gZfmfgltutOkoTB+0GZjhWAoNSUfMr8KWl1ueabjClHuce7t+hA671b30R+
 0KB5URVVfOLQfAvRXVWDYMSUsa3ohf0rg8CgLPQg4ik39nt0dwXLOsHlzu+Mhl1JckomV4rOd9L
 7Sy+8y2s3lAOReKH0c4jFsWMpnDiNLYbKtDvdNqiZy9vofslFpVicdCm8+u77A6JuN9CGtb9uGI
 iTeAfeUqCJXu9sM7kqP8LNIqn7gxDyn3O5DMbXb11Oo7pIW2wlaTUaEKPmBYkz7R4sjJ/oH5LMJ
 EdBIQtHnbojv598RTw1az9d1JDfrG4jEQz/giZxb3oP/cnZaRXumxaPy7uJ1LNdiYS5JeIVr1xh
 xHYAOF50vuLddn8DQjfG9S/52QzX0jQ9J4feIt85w4giu4x1FVA5ng5nz7ZP5Bjc8XvDi51+lFb
 lR4+3kZzcsJuaprgrw5jyjkSyjRNK6RzKCdu7Y/Lz7DKwureVefP/HBfPLO74WWMolZQX7cuksC
 zPHJG5ftk39giApietZ/Gcc3g7oh5WvBPnEIMuU+m0Zkpn2j+N5LdpmKY273InxxW+/FkP+HTmD
 PT508wKHAV7z+UA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ADvwl2sBHsXB58L6mIQuYdOiDgy3NFcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX+HC2/I9f2/Bb
 LCYXEuQC4mGzyxTvGxIhSuxfpnK4UeYBEp6VRJbEETruv1Irt8eFJrHqQTf4RBdZi+vcOolBIoL
 mFF/GOUHUp+mQo3hLhXHXygvxNS7a40DEWx7R1PHn7xsp4+BUjR0hvLVYNlywz3jhq7olYN+ppo
 J2yVkX88JMNHbMrguNWHsvQrJhU9ECFILOnxj/NgxYw04hRLaK5ezi9fAdUET4Nk2fT1RDBoCOA
 EOW6yh+8nM43cKpOXxczibHRnfK18yEHTpQ/RbhGOD5eNA3yWcRJhgsUdttzmefzdxPds2an256
 +e9TPQFIjPp4ORxkD2HVTj+UWrYVEdtEqpe6ZMPgxSRTzHew9e2FvDpIkiA9UQmLXf+VtiF7s2e
 yWAuVp1FKnANhZPj4tMFwwOnjxD7xantXAdZeEK4TAnchNfy4LNt0K2LXfIrQ4+Q5VQ+M9vZQTU
 aM32RmC4GJn6KcnLWdA==
X-Proofpoint-GUID: ADvwl2sBHsXB58L6mIQuYdOiDgy3NFcv
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4fdc8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ijt0iqdD1-hqzoQai_0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34792-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 82EC13AEAD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpiod_line_settings struct stores the debounce period as a signed
long but the setter and getter take/return unsigned long. Use unsigned
long for the struct's field and remove the inconsistency.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/line-settings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/line-settings.c b/lib/line-settings.c
index e54353f5c6cdc93f08da5f062489158d3b078ad1..a0c93daf048f7f7f6bf4d35a431141798e00b26b 100644
--- a/lib/line-settings.c
+++ b/lib/line-settings.c
@@ -16,7 +16,7 @@ struct gpiod_line_settings {
 	enum gpiod_line_bias bias;
 	bool active_low;
 	enum gpiod_line_clock event_clock;
-	long debounce_period_us;
+	unsigned long debounce_period_us;
 	enum gpiod_line_value output_value;
 };
 

-- 
2.47.3


