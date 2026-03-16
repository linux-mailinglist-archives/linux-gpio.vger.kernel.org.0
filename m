Return-Path: <linux-gpio+bounces-33465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAzvCE3Jt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA6296C36
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69D143016D05
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEA1386429;
	Mon, 16 Mar 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWfJIxdn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNMH7iAN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237AB3859C2
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652297; cv=none; b=sz+061CxLLDv2BqmAbTIuG1lltxx7rOsXX2tdSvn1wpwf5ZQYgkBmva7yaV5ZzYKfarg22N6ua5CUEpxVa5DV9PxX5Mq5pu/ZuJE/YQ7ZXu0groW/R21tqy/qItOKryw1+tuRXQOyffSwAno4VAQdwpfk7A0SnUQ0HB7WRXca/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652297; c=relaxed/simple;
	bh=+eC8eAmFeq/qr1/xTtK9cYJ8MQ18m1zZJmA0ouJVonE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vCdJQqho3hkKUVFY+W+u6XGRTQ3dwh5/Xg1QAoKNGR8iWMEsCQQiuZFEzJT6BLB8BLUbBoOvYJE6eRFGWkSIuhPNOYwscChp8wcY+1m3dokf5sWDGZkGBdybtnfuzIWxs6MPVPwhmv4Ts90r7O8wtRmx6kFDdshmRx2h4ksTPtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWfJIxdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNMH7iAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64qPB1724895
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i72EfdgJ7doLImzDWatjm2GnnkPEZNv7sHePPRX+J+A=; b=CWfJIxdn7icUCxum
	1Uo1mlsWgJOsUfxnavJTE9oKSTrDTMVTrSI5u8SPiPfdZrXVOdsvcJ59HAH8WSQg
	y4gvt86Dt6P7LBcZsdu0ojBD+8Ik6jPpTjEF5JMWHiV7tx26E7zaUDSbVpvbmFvO
	J7niurtpXHJ3VuTeOdz4v+jSY02CPsPKRhCYAtvBo+YEyE8vJaMQvbKVPkSNrxnL
	W7l7ROrpAc2qeO3W3hpqqbkDej0UnDO7yXDygEQWCwsFtTCEYEqgLZnMjEqTnRQD
	Owmxo0+Fu5KuaYCmPWFVVrJRFkh7JYSGjdf4GOop6mBqQK/Zul9lPsW2Q2yF9Drv
	7vIdaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udmuun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso595051285a.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652294; x=1774257094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i72EfdgJ7doLImzDWatjm2GnnkPEZNv7sHePPRX+J+A=;
        b=eNMH7iAN+ZfcOg4NxZR4jDeAqW9aU16cHFKH2gx1IMjGtPWkjLzvcXrF20MPdmwTtc
         ekOnIwdxIBKRg4sQmyJ6F5I7aCw5AJ8yTMtaCtSxQZThjVHTWD46ImmDtAAxqYaNCRVT
         bv22BDAiK4G+/MA5P/TCT51lGhLF8gJj9jG1PrmHNuwppoTtsDaXI2VdbTv+1pldupRz
         AV/W/nXvaQ7dvIxwldcce611iojbI9lyhY6DQ7p7i0GXKmmhQ6U3FjeaExbebaRdsiF+
         xbE5EEtZJ2Z3zGnVusi0BT6qf7/pVBTDIw7OD0yrT0C4qRp3qdHeb0LWGi4RpEi3IHCd
         cO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652294; x=1774257094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i72EfdgJ7doLImzDWatjm2GnnkPEZNv7sHePPRX+J+A=;
        b=ei8dbVY/FexsTQVrfdFMBzFf5yMgwjno3NFqCpOPJy8goC7QGzzh9j4rMJ9BiEEYqZ
         BICCe6cR/bIGXQi0ddOWbiK40sUPcBEHUYgYiw7goEyix/3uN6Lr3PCKxqRQzpQLbMID
         MktIkDvuuEL4NEAogVOqZFrDCX+GIzn6dDX7is2ghFh58AVZUhPPeXrSjk/n1jjGcO5d
         rDdsQ/HSo2p7VRBrcq5vr3GHeYLDahj0sQTwl73FNPwLz6COR7+nxzxfElURqZrKKrta
         k+1cgFBYUx3stL1CfraCpbHZDHUqJUpP46T3GelQesjOvBzQi/5O9XHo7C/tHztFb3J0
         o1ZA==
X-Gm-Message-State: AOJu0Yx0LHmxyT/ElJVO3UL7AaXWfCg/mc3av2+SLBgWUdCrL89B0wg6
	XUyHpCM93jJDVR82c4ljmdWqPCPrMBT06BiK7t5gHea+lneeRUahNN7z/kQbmhsBszAXcG+apkZ
	/g2FLb8BXKR1lu1qP36pK1pUXXQDDOX0aKzzeCldmmwrwwvpKMI9rU2WfHHs2UHHS
X-Gm-Gg: ATEYQzx2LHggcOxqf0a3lcHiAk2KoFHUSUSmz2KE9JaWrwDoO9xXLFJJUYko7XazMRy
	kT6Bpw8V/WqdVOV2SVUweNqDJI0GMOfdnB0v8UEYr03UGEd0TkBmenF6sLbXFoiiOc0AgF/AT3q
	JkLYCveoZg6NAGMFnAC91G0C+9TXbYWRLv6jOXA17Gr5SgL/nu+43UaEwx01ZRaEpqo3cBLAFY3
	pucB+t0ZdyVyIlfT5T4DYHU3Om0wyGM0wn0tB/AfEuPVO6SKN7EPK9UQUm6S2LadJ7YlNWgWMiq
	qQUoLK7Xsk2C3s/VaO4y6XOmjrOmpPYEPdvA+fPbpwUV5+P6WKTwTcuE9+jgjsyInCoZxtOxJay
	Whhdnmx9ouARKXiMWOc7v+nYYK/tKJltydjyeOqQx/6wcuuo1E2s=
X-Received: by 2002:a05:620a:44ca:b0:8cd:79f2:dc50 with SMTP id af79cd13be357-8cdb57aa4a8mr1434708285a.0.1773652294342;
        Mon, 16 Mar 2026 02:11:34 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:8cd:79f2:dc50 with SMTP id af79cd13be357-8cdb57aa4a8mr1434705685a.0.1773652293841;
        Mon, 16 Mar 2026 02:11:33 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org,
        stable@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/6] gpiolib: unify gpio-hog code
Date: Mon, 16 Mar 2026 10:11:20 +0100
Message-ID: <177365228183.54363.13735316568548509348.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7c947 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jtPpctr3BKvZZnv9HkwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pzaxLvNWyIiX-7e1rD8Ld44X9hXbCfTV
X-Proofpoint-ORIG-GUID: pzaxLvNWyIiX-7e1rD8Ld44X9hXbCfTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfX2ICcgrToYrm7
 ZidFBLNYZN91X9/ZUvGEgQY8n18GgB0cxpq7MTeBH1vQ+tWsxYCxjDAcDOQ/xR+cc0miXT3DPye
 XDkxvNyj7oNggxh/RyNEsBXawwXOvlKYdyRN4IrmT59rIWUgd/8Ae152SOqnJOjWueyyUhQLtA3
 3S/b0efbgBsQXBu+PuO11+142yjdg7aY01jdqTPpse+34twFRT20IrxAtL75DcvWgsNHDw/ZakA
 S4psCmmvlibQHr+TI0HGzWFbV0FCOjvIIII6yPwr5u2PO1qITwPjeCrMTygCTtSCin9wcZl35Fy
 j51lCj6xTGIXnSs9RBGtNOC8MKUH6R8A+XUjZtOGzAGgZYNIAdX/AvKo0nPwtwc6MnGzGUvwuMz
 MRi2yGxRdLSXA5dcqS9Q9dLXA7ral6hsD1BzX4sinYQg/Tqq+2BXgH99LSQxAGmgOXwme0gAlda
 AtpQU21XfT97uhQQzjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33465-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90BA6296C36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 09 Mar 2026 13:42:36 +0100, Bartosz Golaszewski wrote:
> GPIO hogs are handled separately in three places: for OF, ACPI and
> machine lookup. In addition hogs cannot be set up using software nodes.
> A lot of that code is actually redundant and - except for some special
> handling of OF nodes - can be unified in one place.
> 
> This series moves hogging into GPIO core and bases it on fwnode API
> (with a single helper from OF to translate devicetree properties into
> lookup flags), converts the two remaining users of machine hogs to using
> software node approach and removes machine hog support entirely. In
> addition, there's a patch extending the configurability of gpio-sim now
> that it uses software nodes for hogs.
> 
> [...]

Applied, thanks!

[1/6] gpio: of: clear OF_POPULATED on hog nodes in remove path
      https://git.kernel.org/brgl/c/bbee90e750262bfb406d66dc65c46d616d2b6673
[2/6] gpio: move hogs into GPIO core
      https://git.kernel.org/brgl/c/d1d564ec4992945db853303dc2978256bce8c0b4
[3/6] gpio: sim: use fwnode-based GPIO hogs
      https://git.kernel.org/brgl/c/5cfbd0eb784f19436b5d5a9a7e0dca862619739a
[4/6] ARM: omap1: ams-delta: convert GPIO hogs to using firmware nodes
      https://git.kernel.org/brgl/c/e627fc9fad93d59765dd16adac1b2a9bf68d7523
[5/6] gpio: remove machine hogs
      https://git.kernel.org/brgl/c/dea046e7f46f2357124a465e058c92cac3e351c5
[6/6] gpio: sim: allow to define the active-low setting of a simulated hog
      https://git.kernel.org/brgl/c/696e9ba9a3da3d919d08a1abf05c9288311858f1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

