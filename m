Return-Path: <linux-gpio+bounces-19847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99644AB13A5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 14:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81D7B7AF7CA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 12:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10474290BA0;
	Fri,  9 May 2025 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HErkqrQK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81A28FA80
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794441; cv=none; b=SjHNKzrQieQVFUY3B+uAbBBxiuZFpwOJT9JcTFfbFonAfKNnV44kSHrf/oMt/8sq7usTMIkvv8P5r6aUqvou0+iqx6LloeeHkpz5/drmr6nADFIGrKvd3yIxHzIPvKmWKPdZRqMvhgtVyXpfn2E1gWlFzkztssznF0KTE0t8pck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794441; c=relaxed/simple;
	bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USlJUlyDYeukI5QGjpUyhFwPsJk5PPPYYoEJUG0+L0G6WxVqB+5E05HU+6Hltr598qmF9sdptHwxBsd0ksGY8WqGny7HW1Pa9yz6X4pGyDqOjIYlpAAdr3qBSbW4djR2gKlzayfO5CKp3n5bx+0k6y6rUJ60RSE0dyj3bPiNwlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HErkqrQK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54e9021d2b5so3953145e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746794438; x=1747399238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
        b=HErkqrQKP7FZMBiFA+4j9WWBFxcxkh8MUw9fWEDg4mqJ2mZA2VZXSJWoB5YmiwOA7Z
         N5hM/605MxsGhaISDtMG8hl7Vord3C7rB/ewJCRgr1Zs1XjrJyLPBxaTUFkYTJ1pbt49
         3H5HusgBUCpvD80Bt4j7zddk27RFNCdkAHfXYx/C+5yZ78w+2Di7EIeNknj8ev9w7L9x
         GHZgUP37AfgPds0nC57fXCAc6vSYgHrmbNPFVYTs/AHjkP3lQwk7+ZCj0grOgv8egR37
         5A1R6vVUif4PA5p/Q8SddLfiFjHrw3azQTx3VEA3a8r5mwkC7+6IvotmWS5fiMwRcGkA
         L4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794438; x=1747399238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
        b=Cku9ICRGCbFBLhJ+/KJOGX0DM4Ctmsd/aImlCyvuxPbAtu3m/vA6pqWLStBmXB696+
         qaPM0VPYGzJ1iVslQgyJTRwa/qIj3ULMyles4g2mX8j04d1xRMjqi0a5udH5oUgAcscQ
         qOBsJemeFUnADQnUi3+m0lg8x0u3+tTGtLO6X9SMupN8fl5s7/MbrE9uJ6DhKHjLtn0y
         N665oXy6GllBzQ9hXuHhplm1Ss5Ie59fn95lHQeP0HVdMA92XRb6QlmxJZJwhEWHQuvK
         sWvttr/YEcdi+GPVN2bmjC6SJoKycFiVEM2ehNB5cs9cRnRgymqTreY0LzVPXMCCexNz
         RSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXatzvPAbR5ORBmHDrOUj6Utyap5iVfteHYN4RoCtQt+9CtvCYf7Wmi13zTms49Re9Wp7pJYx2pzgfH@vger.kernel.org
X-Gm-Message-State: AOJu0Yymek671PMRxIx1akN7AByouLzRaVFCqmqgdmh6FXorePAezXxN
	y/8lI4brMv6z5Y7ZdPQbcgsjMXWsSJpUtSdrIIoW1gZq1bSJEAkYX+YR3GgPOgx1r3iBa4kJTr+
	oT9xGGjSg3upeXsfr5rXxDtJgIZxpi8ndnHwIQA==
X-Gm-Gg: ASbGncsniM22uUhoyIgmv37u5XOOuLOUL8uC4NjAxIDbTNZWwrPERnOuM108FpvAmX2
	dGKK5UAfb3PV7gr51LRDId+k4r9JGSrMyKpfgNzcma6ujdCDv471EHG77m414vMwC2FeLFPp/oK
	UfSYLbW334e9H7fa1siUx7c0EqNGHS4yxP6SFDuSoaxWI+T1HeysbkiQ==
X-Google-Smtp-Source: AGHT+IFdaNoxSwXadZPcFSu3s1a5OECzl0nPHiRim09tz00SJAtaxjhMC0Ms7Db/M0w/VxGQVS1tNGzED+Wljh/WZKI=
X-Received: by 2002:a05:6512:695:b0:549:8b4d:bd47 with SMTP id
 2adb3069b0e04-54fbe407821mr2923115e87.9.1746794438053; Fri, 09 May 2025
 05:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508130612.82270-1-markus.burri@mt.com> <20250508130612.82270-5-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-5-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 14:40:26 +0200
X-Gm-Features: ATxdqUE7pXlfCMv5H1Kgd5pteF0BctNTVcpk-CgS0AiKblrCPf4IDIEcE-yR17c
Message-ID: <CAMRc=MeYYUc=FKJdArpqv0D2fUt1vyCJiZzjYyN95aMv0-b1WA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpio: fix potential out-of-bound write
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 3:07=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Check that the input size does not exceed the buffer size.
> If a caller write more characters, count is truncated to the max availabl=
e
> space in "simple_write_to_buffer".
> Write a zero termination afterwards.
>
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---

Looks good and does fix an issue that can be easily reproduced with
KASAN enabled. Please fix the issues reported by the build bot and
resend (as a patch separate from the rest of this series). Thanks.

Bartosz

