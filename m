Return-Path: <linux-gpio+bounces-36041-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cODOIQx8+GkmwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36041-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:59:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D783A4BC0AF
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 250C83005320
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F403A6B91;
	Mon,  4 May 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj6RBsZg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDB5LbIl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B277391E57
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892356; cv=none; b=Ab6KbbA5CQsapVwgnPq9sEDUJXSFydERecXcTwKdWRd9PJeEsAxQ3rBArOxI9eUGpoPwfvZ149DKv/JDF7ijfA0Xry3v4orgxbM9t0OG3wtO1QSoCykmS1QVEgYhPp/5ozjV/QJrC837NOUPAEHuJ6NmVi5LzanQwQ+feumTzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892356; c=relaxed/simple;
	bh=GeuwkKmozEXjhOSGYCTl0B+YpFwHa9j+X8dOyTudOQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IVKjZ4RiBYAVGm7z7qgASoQcEhs1vYR9PvuITh8bzJyACp+oXOK0kEWsg2sM2L6BjnU8NfVg5760XTiLg4RlzsEd5aE5Ti8W1gqRD/W2rBWOuXf4YwgG/6BQ+BG0ZHfn9f15l5RCx29QkxFpIEy7ImJALkz7tyYdxr46vt2Apb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj6RBsZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDB5LbIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fSd7459464
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 10:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4tPK9/9PrhrR5/3nqyIB4Y
	/UqkEl2w9g31g3wcJI37g=; b=Oj6RBsZgyiSVHBLzxFsTEujDwR/xeyrC0ksPbS
	KxLiAzbtk4PVlDIPCjxE1D45PJv6BtqfCcjWYJK7TuFVxKGneAVf/FQpmWsS2e5K
	4lpLC4E0uw2XMNirb7ekNGCwSk1e+YdN83Iftesx26rQdJ8WXBWchK+jKy5kH+k2
	rmmRt30dYNYevyh6KEJh6pZ3LlWtqLZA/HvDN/1oY6nLuGcCDS+ULL8K4O4QDIzb
	K+qiqQVhjgG47x45+BXL2Hw9Yoxosl9/rhnXfI6tinkt0bMqU7nMTyqA2nNsYK2R
	3AlACs7BDGILTYQkS9lFHerVj6A0QaR0u29nT8vpUz7Sq+xQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejnagm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 10:59:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so51405891cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777892353; x=1778497153; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4tPK9/9PrhrR5/3nqyIB4Y/UqkEl2w9g31g3wcJI37g=;
        b=DDB5LbIlrRB/x5fEGirnReER1vlY8zBVGAlGmK/Liefkd5IVbLCqO6zLuLxLeQqB6F
         C218vHdYCMxRxYz9CN4iX5a5RVyKDpOa5CGbNoOJxLsPqlGU72LKJzjvTyHm8PzY3MFD
         VVBrPKWfUkDAL138pZMZgB78V2uqDhULJ5st2mgktp2jkwyKLOHi+hbi0MSu86F47SRy
         VET2rOOxQcLnwT9P26hmsVrgcIx/Si0dJZCo5Q3/2xlAqiJf49u6BNQ8BCYLuVF4LHhC
         HOsFP7n7kgHOgvN/A7gN4dTD0RddpCfDwoS4EyfpW8aX43uBM1rlMSaK0xLIdGGpvsb0
         gwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892353; x=1778497153;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tPK9/9PrhrR5/3nqyIB4Y/UqkEl2w9g31g3wcJI37g=;
        b=sFUCFywbdV+3N2uj8PiUbGM30aLR4xT9hzYJNeTHjrBcss1N+Gr/oUDUWZhIVHTcM/
         UUra5d+NswEFHkLuoFxo3W7WB0Go3hsi9eltg7kC/HNxilkTa8xbDrSGHU4sjqYz+Ku7
         kAEdI05QVnxhR8hbb2ANrREO8b+BzQ63hUxo3TURwZuNulx3/4QycevFvc/jsh91PMfn
         4vbT+OBY49xsBy23IcJ7cZoi66cMiP2IjswsT/JxKCa7byx7sqQA0BEMdrl3a/qR+Vsq
         oMO8i9C5QYp8uhKwnULEGLITSnoewhtm9UcEpKKx5dBnRjVp3zXcOYSca/32tkrfVpDi
         9S+w==
X-Forwarded-Encrypted: i=1; AFNElJ9KnDXs7soSM1fB4gueBN26wvHeZpB4E5jioSAaqq0+DZx7VbBC5uw08sT1Htp1GWWa/NAsES+Fp0NG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQwVUS42FI7et5Y0/rOVqX/kPI0S3xZu0MBeh39tTL+RaKZ20g
	PowMslNa6lKnbuT10NB1P+5nc98bWKlOrncOyQPzHq41oXqTKNo0ruvvTM87Dgn84B+Sfzoxo+l
	0nzAq+SGWc66z1dshfojRXb8qI5txhqwrX9WDNkvJrP8MFkJtfN/ftxbctmpNmsOu
X-Gm-Gg: AeBDievVrDaMiDXZVgtQ4jT4EkvrivA5TmYeT/n8AMs9dwAGa34M1SI1+b4g/No2GOq
	XcRnLTxQa6N6SRRMJ84fMby0hoNra3q695h2waMtmkHcnjqLfviZRxtfHYrog0TG2xaD4jvjvVr
	HCao7oGxocR15WlcGaftRXIoeQF+P45hL4pC6QE5texp78j0j4dNTHxjzTTr71LzKJwfJ03OsqJ
	QmauOXiXcJiVCTWxUktkMu1sYVAg+ELEekEpBMZ/7q+AyOX0ml13Yd0a3vSMZUrid+Mm2DKp+67
	y7fkJ4HokT7Vp7Ko7ymjtXmMW9ROxIbD9wb+52BT6eiTkYpz174/cAOzxvI9w8l0iwgK45lznqQ
	SnKXjqpLhtr+1R38iYP2AavFO6Mnf37jELX9klvxmUAuXMhqXWRHJPqMK9/Ix5w==
X-Received: by 2002:a05:622a:13cf:b0:50b:1e5d:992b with SMTP id d75a77b69052e-5104c15bca1mr130483111cf.54.1777892353109;
        Mon, 04 May 2026 03:59:13 -0700 (PDT)
X-Received: by 2002:a05:622a:13cf:b0:50b:1e5d:992b with SMTP id d75a77b69052e-5104c15bca1mr130482731cf.54.1777892352563;
        Mon, 04 May 2026 03:59:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:56cb:50e1:b507:63d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm474728135e9.1.2026.05.04.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:59:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 0/2] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
Date: Mon, 04 May 2026 12:58:55 +0200
Message-Id: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO97+GkC/4XPwW7CMAwG4FdBOS/ITdK4cNp7TBxM6oxIpYEEu
 iHUdyflAodFu1j6Lfmz/rvInAJnsV3dReIp5BDHEtqPlXAHGr9Zhr5koUBZ0M1G7ul2SRQGmZg
 GmX/G2LPEnpF0h+CxE+X0lNiH3yf7tSv5EPIlptvzy9Qs23/AqZEgsfVKWUNsNv4z5rw+X2lw8
 XhclyEWd1Ivy4CqWKpY1rfQGjLOAVYs/WYprFi6WACg2bgGoXMVy7xZGiqWWTpa3LuerLX4V8d
 5nh/WBKtzowEAAA==
X-Change-ID: 20260319-baytrail-real-swnode-7de7a3870f78
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4351;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GeuwkKmozEXjhOSGYCTl0B+YpFwHa9j+X8dOyTudOQc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+Hv3kfn9q3KLtlCm3fn11mOqUrE7q+1UTfRCU
 lgfgXAFan6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafh79wAKCRAFnS7L/zaE
 w16rEACxZPHTuVyvPShATd3lcVT/leZP/rXZFhzEUi52xDze3Bbkzj6+1mWA4uLzzF+EYPs7WWH
 sx6n+kV4Kjow5+KNnsxVvMNBafH4h0xtZ2toUrzaBg0sG3Stys8hNyiTsR9wDsUiydJdHr/WnAK
 Hfs9crQeLDjh+pZekxDdwhFGeLhvNTN9jxqEAb25PZOvAJPDg7MQecn4qZhRpVyMh9PNhhMBv0p
 Hpttf5qmFZ5u1qNx/vLQMiuiEYURmL3o8Gt7xRgUiTODpoAAiggy1vRjK2vqfVeO/zwzNqqm4d7
 uS8RTn1c5r3AVEbeiAAQ9SU3A6lvbQh9CgicZt+U7lNR7UsXDzPXZcnuYVfyTPCoh0Kip1g/PNR
 sZaFsDso0fT1AJal0y+89mY4x5ycWyMvOHVKYI58qIC4WKpp6KIIfFmCC+kInz2BJ8uO6JWQFfj
 7MsxYUR7GYWg/m7SstGa44ZYLDXPSNfSvncyzYrpUHiVDEmmS2V879gXx3vA+aApuVcjOAxNujP
 q7bahQLtxxcYuE7kqo9xrYf23B8Msmjq1kRtxIbctZ6QazZFZ/Md9KcueeEiZz0P3TaZ45iAvI6
 qfRnmaFwbavDNS+WZ9xNItobM8JA/ubnD/EN96cWV4/LJOOVUluFgI2qHvvXm2CTCSb4sSAmGrK
 j3tPfeBXOmKs3bw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExNiBTYWx0ZWRfX4fys1+O6Ukpb
 ORTMYcFFC7vOjuQHl8gqYC2PDAM4IZhcvE3LmOQ1xbwOujQxTcI5QYGhwo7SJ8q2CY+e0aEicsa
 ++hMn93AQ/0RrO/WUEcxe8JiYm6M6td36NCiPOIBG7ctpzcYqGV2PAKcnoDefLNWvc2fkdHnMbz
 0eqZpyArASWlePVYankkTf2KOa4JLo8ibKCicXzPGSZKS3G4QvkrtWzLhrzMktzBtFsc5+QLAJ3
 Cv9eiD6fvBXsEOBhk1m3rAktUdzPoSIEBYBfqB5f7/JPUGz9XdP5vv+UqFR5hyS0+AIhbEVxMhq
 FCin35UOmGh3MfjA6pad2GLdQ8iJKAqYX9UIE7Huxdyk1hDuk2NEzGvFzagLJzfsDLRDmScrAbz
 qzb9n6ynGN1AIMFVW0OU5IblXD/7vLwY0ibnmjWSsNGalWJ1C0kZYXuL+2E0jXY90LaXmILz+Nq
 jQMDcBy6+CHuIihGpfw==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f87c02 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=_-RKUVJSXb7bi1SkcEYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: m8ZJd2jsmOOg2s79Kat5d2pPhmNqfqEu
X-Proofpoint-GUID: m8ZJd2jsmOOg2s79Kat5d2pPhmNqfqEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040116
X-Rspamd-Queue-Id: D783A4BC0AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36041-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

First let me repeat the problem statement:

==

GPIO software node lookup should rely exclusively on matching the
addresses of the referenced firmware nodes. I tried to enforce it with
commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the
key for GPIO lookup") but it broke existing users who abuse the software
node mechanism by creating "dummy" software nodes named after the device
they want to get GPIOs from but never attaching them to the actual GPIO
devices. They rely on the current behavior of GPIOLIB where it will match
the label of the GPIO controller against the name of the software node
and does not require a true link.

x86-android-tablets driver is one of the abusers in that it creates
dummy software nodes for baytrail and cherryview GPIO controllers but
they don't really reference these devices. Before we can reapply
e5d527be7e69 and support matching by fwnode address exclusively, we need
to convert all the users to using actual fwnode references.

==

Now for the new approach:

Now with the recent patches I sent or plan to send out, it turns out
that almost all existing users of software node lookup can easily have
the software node's representing the GPIO controllers attached to their
target devices as their primary firmware node. The remaining complex
cases are: pcengines-apuv2 and geode-common but in the first case we
have control over the creation of the GPIO device - we can assign it a
firmware node - and in the second case, we deal with an MFD driver so
can export the cell's software node in a header.

The only remaining use-case where we need to reference a GPIO controller
described in ACPI from a software node is the x86-android-tablets
driver. In this case, I think it no longer makes sense to propose a new
generic interface. Instead, I'd like to propose to keep it as a
driver-specific quirk.

This series proposes the following changes:
1. Provide acpi_bus_find_device_by_name() for looking up ACPI devices.
2. Implement support for dynamic assignment of secondary firmware nodes
in the x86-android-tablets driver. More details on how it's approached
are in the relevant commit message.

The dependencies in driver core and GPIOLIB are already upstream.

Merging strategy: Both patches should go through the X86 platform tree
with an Ack from Rafael.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v5:
- Mention the responsibility of the caller to call put_device() on the
  object returned by acpi_bus_find_device_by_name()
- Use set_secondary_fwnode() instead of hand-coding it
- Link to v4: https://patch.msgid.link/20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com

Changes in v4:
- As pointed out by Hans: we don't need the notifier logic so replace
  patch 1/2 with another, providing an ACPI helper for locating devices
  by name and simplify patch 2/2
- Link to v3: https://patch.msgid.link/20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com

Changes in v3:
- Drop dependencies that got upstream for v7.1
- Rebase on top of v7.1-rc1
- Link to v2: https://patch.msgid.link/20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com

Changes in v2:
- Completely new approach
- Keep the cherryview and baytrail secondary fwnode handling as a
  driver-specific quirk for x86 tablets and don't introduce any new API
- Change the return value when resolving a reference to an unregistered
  software node and defer probe in GPIOLIB in that situation
- Export acpi_bus_type for use in x86-android-tablets
- Link to v1: https://patch.msgid.link/20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      ACPI: provide acpi_bus_find_device_by_name()
      platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips

 drivers/acpi/bus.c                              | 15 ++++++
 drivers/platform/x86/x86-android-tablets/core.c | 63 +++++++++++++++++++++++--
 include/linux/acpi.h                            |  7 +++
 3 files changed, 82 insertions(+), 3 deletions(-)
---
base-commit: 085f14acda1c46ab815605ecf2341afe5a691eb9
change-id: 20260319-baytrail-real-swnode-7de7a3870f78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


