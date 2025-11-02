Return-Path: <linux-gpio+bounces-27920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA4C28C41
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 09:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED01D4E30E1
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 08:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B759B263F4A;
	Sun,  2 Nov 2025 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EEcug3t+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFFC18A6DB;
	Sun,  2 Nov 2025 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762072876; cv=none; b=EpiWq8WvQ2ouLaWrEPqnSlOsj2CK0SqLrJXwYipk0JI8eUSjHoWm0pIU2PvmhU6Dqf3klbZ6E1QdlGAqfDd+4a+KsdJ26iN2Vj7JT2iO6ldcK6QJem2+UW4jkfnL00wqsVh+EiOhEwdjeMrmzyKYqIpQsmt2F2PZ6SkFMJQpLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762072876; c=relaxed/simple;
	bh=4EG2d2uie7QzC8hrxIoPwWBCwZkgykNAKWHbQU/G6po=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=YuXQpkEjj9ozFhJVEpbyE/VYn4QzSKPy/2jGpteYm9toAGJBjM+h4dXtBiekF5l1VRbfZijJTrq2/WDKz4+D2lYFo61XaIgSpljtn4R3DVfp6teftaaBhAGY4qaEbNK33ZYeZWMj9WKbn1mzCJikbhsTarWb8kyQPthWwyV5OG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EEcug3t+; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762072862; x=1762677662; i=markus.elfring@web.de;
	bh=thk/H22BgBbhvn1cemq9Jr8ANgQfP4vEBaDKXJu9Uo0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EEcug3t+LQSg632NM6C+pwVUdZYyXYpL0b7R6VNEgMrMk7NnP+dH8yIFKPKdY7Ke
	 hnhnkDWd7LBB2Pr/HuX9EHujj4HbBGnSUMXzULdKap9i/smDfyk3hHPbQzdJPWEud
	 87jPlHYHxOyMTFFpWRlyZLbSPo0b0BN6F44tvZ44UjsVzIOMZFEzd2nYyVuhtUSmO
	 2UlGIYYOMHlquF6ggaxJR2ZVm8NLmsRdWMjFg/BTljWfv4SzysL/2U9d/LFeamLNr
	 CGGLSdc6CQ6L34bebVx6whncFjsXX+Si6FX1gOtx6np6UZWHJJzSANJSkMbHZTmaA
	 bfHgnplQCJsjm9lrSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.235]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmymp-1vvj9m3JUl-00dkiP; Sun, 02
 Nov 2025 09:41:01 +0100
Message-ID: <619dc3c1-d5ff-45e6-a961-e5e0aa5b5eb6@web.de>
Date: Sun, 2 Nov 2025 09:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-gpio@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, LKML <linux-kernel@vger.kernel.org>
References: <20251031150631.33592-1-brgl@bgdev.pl>
Subject: Re: [PATCH] gpiolib: fix invalid pointer access in debugfs
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251031150631.33592-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sGLt8btVHOrmcKjf/cLaxDRvo9vvjPnmyTH7HlQNFlC4Cg0/A7X
 hB7S2N2fsiWxPqQk3fAGy4Flp7d6dAQRgl5rMS0X7n0pe8qPCBo2oG1YJX/RYp7mGscq9YH
 ELvCcve71DfdbUuGR/eE2ZQs/hwCmzfLep2NSWtOKO8uwkhCitmHR0ZMXYliEYyUQj/jkLp
 m8GrSK92SBBjvO2IHJBzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yRfouiPIvrY=;OjX0QloXswKullj7GcqmTI6jr5z
 97oWw9S5j/4766pCDGtN/iHAf28tigVVvNChy2rtd280dZeSeFmM5SxDVFcEASL/Y94R5WnJK
 EwBkFjTAqLpd5yPCo+sNneBdjkPASFhVXazFmcl14Cf9XIEXylFHEK9a1OpgKrDScivErXHa4
 E4oz3zaXqce9EAqAdgSxhRrdZy1kb4hi2dD0LHYcLqr7NuLoOApvG6gEKkXrnUyL9ltilfXol
 CswcoQHWrQg16BhnmLiDlVaSO1EnveKcBMbQtAVO1o3CS2t3gbV1zJYDBf/YEjtQBejFe3SsK
 ec08/f+fPngV/Ju5vErP47GkNywz8Pwp4yKmlQ07pBhidRVniT7RyIk8tLrIancb3LapoGrV0
 oqfj+VjLVohk+jDSBhAgDOuAeggIU58Rf4sxdy+167eSE2N15z3SaEtjKJ70jDRmcg0y9uPWP
 QzV6ECFhZ0hIfqUg4hqG/4IgtDhjbgBtMjCQkSgpr7xrsBhVVYBO33OW21qVVY9ftlSVtajNQ
 5DtMCFiq1hYgQaz+cy27H4Sp5L0cGI1QWjQcOE/BZX7nMUmCFpiYmIeZAyHfQgGZ8yeF7ABf5
 +nMfDS5rZgjgeC+j+PU1t5w0M4shAcC1Ab4p9RFN79h42V8VdLugE69f0y9SqzTK2bSGkVPwz
 z8ebe84Lpg77vX8mR77BJZXpQFQiNUWe7TluFdCPyISK/LBNadBA6qYwYcMGdkgRTkk85M3JX
 hWmImo3vjjWC36E5qmbXaVcpbf2xwaA/KDSa5yMmD5wHWyfEYEsxtTizvylHEzkVT3dyJ/bGZ
 RpCXOFxA3DVeZ/hx1h9B69Vn3mtLXABSGS//CAteD0motprKHRBxcplm5ESwb9rja4TZC/csJ
 0VecLnZfncyamWYc9LJFkTVqwBYK7YTt3UV4w+pYRY8WycaXSBdc4yMITdDPYjDItc9bGVp/J
 vXLEcK78+llqlsuoeTG/1jyQt6COKFr+gt2Hy8xJOltmKRZOUBGFV7rnPMFrCCOp6AzHqo2kS
 onwltIFsYgyKtj6V/En3f+LQsjKLC8uL3fZ7YdAGXD4sPULDCE2+VhewUrWTcOAKXZGZSZHVY
 twE7LDJqN0fyUk4qy440sZZ9nO4vxhl1oHipzRVyA0qVC9oiJHy03vq5qrJeJ39rubsDZdTqI
 fqAYmnc8WdI1MD+MMgHcEoCsidgbUxQzqYqCCywhGDmqm73kIG1y7OZVFKSWTqFt4qbkDhXuf
 tOCMU6pXFZG1kPYqEFzSwn3CXxEp26Rd9Yo7Tpxq/JKdCgdX0HIkUZDKz6yi7JEhGBodbS318
 5k0/sz9MvaUTvoZfW/IaY51EbgOW5XZx3BT8tKqYCyhyidkSwsOUWSfhZZnfpOp3ZdpB9msob
 yrKbu8Kb5GchB57BEbVgrSFxH1lYqir9YZNa6hPyrE3R89CQ0psUQajwNnUrxZC32MLWftH2u
 79GFhH+CDb8v929oRQuhXapSAN7AaWhUQjyUGTdUQDCGni1LpasxXSaa9TOXEMoQPaRjjKmiy
 XA2jI8YwbQ6C+rrgxbCWbTR/fyFh4fQ7tShgIhIcus/aafx/hTWR0u+HtX37o6prHqLYZTEuo
 mUEZX+k7oCQErSqB4qxv1KPA0m+DiIjvIaHZd1W4YjB5n2xKbMn01Ic6nrH0WycyCMpNyn/9N
 OWrK4Hf5U1kKylPMUlYpRoqHh/szy/yoY8zYgrrOoMEG3xgPfPz32wXYIXZj2yCDPRFzz4Fq+
 E2I3w9qrbsCwVfwcz9423f9Y/QWSRBw5XUNvTjFOXU4C+/+nODHc5zVhNVaWnR9vCeN/NWg10
 c0enIRS4V7x2hMXRPg5WDbVjTwcxNJL2anLxci3Eg0vh++qCvoK71gmVsyWqj7Xc45+wS0Cae
 Or4EOHlWTkAIND89WJR37ygNlg+PTJYDO0ZPy9mvW8w3x1E3E6EnD2hH9FoHvJwNR2gjA2iNA
 i/2XNin3U75HeU5ugn5c7Xs+GqYWQ5gYYXCZvbzGakNG5O/8KrCDpRPurT8ztdRDF8rKWOh0N
 iziR8/wWP4EMXqyC3qnG+tUo1tpcmMS3KL/MUWRzmQsrV1Fay0cu67LgTzDK94XrPgt0H2Yh6
 AznhbqLa+gyB+YuX6koqeFIW6G51WAS8XgVNJeGUp+iX2aGFb3a2H+HSBngxu3LUQWtMTVJWL
 RkceL+y1OFtqQcYLrjEUhrs99bBt0oTZBe/QccDaaQhOmMUoFfunWjgpYgHUf49Oiuft3UmKu
 T5vvTbXzBZsYPFmMKRjoCXAwPpkW6FA/jvdhRxCk4m7qePYlzlp25K39+9zurx7cpte2hc0cp
 ExC0ChUPUBrG11wvAAMYDmapMXgQMR+WZthsRWUZGdyfS2x354OHr28feYxTR21dK4q53b44q
 VrXfzFYv/3NcT1ElFmmkwVWG6Biq1zUBz/n7eriWsPcZWhrdFgx7HAS1aKusaPZXMKCj9LX52
 hYYVWcOhx/cxd/jYvpk3qQGxP43I6VoG0hDXd++jGr3DyFUJ8+eeve4Jdt6EzofIxfPgLNXDu
 S6Rp0dtBFA+1DZr3/bChZUGpiRp9SNQwAAw4GfzyOEXqZEj2R9X7RxeVw3U0iYrbRCl2vptul
 VuFX/B9Pgk6m3xTzXxZzfLSi39VjNKevNiOMuSGqJ6/rNytkLerel64nDHqUBW7+fxRp+Mlyk
 qohZ41abuRMDXC50u/0y6a9ipb3Uus2thn6D7nbY+7u8X5SbJG0i0USjKvxwd4+MmoofIFKu0
 DfFp90nRsN7P+nEOlUMML87/qEuEw54Q0PAIj5JYC8h19IxF17KbQIRmdQj5Z6R0EZ9THdYj+
 ACpFFMhWDdPYsp1qJQ2Pan8nDcgtd73fWfQJDc3DOkyfoQ3PMjIv7gjJQTAUSjohr9uZ0Fl4D
 hdMGZ24AlbVH0Kyh35r9FaWVo77YxHwi+IMAAyoS9QQx6jNJFAHIadJgZqLZxWmjCaug44nIr
 RM6WwnMDn+vabymEJMUDn8O9MPdoJ4pfFB3pKg2UxczQjCIx80x336yk4I024ic5Gjh61mfsi
 e+yTtWpmkObjqD4fznT/h/1K1Vq4b9JJhLoMyWI9sayas8JC4+Ou7cNhDrdBGE274NSqPZg5C
 /lLfP4uPSanNo3aixPP5Opv33o0t5KA5Fy5hp5TIrymiF+dGPhzzlWMqQueeEsCIKU8jioPCW
 MNZq7qpVXKiHz8kh6WguBbqq5zXoLh7LzSdjc601R7G0YhCNLTetNRPdDzJRpNg+LAlLamkr9
 UsgBjeWudyHZ0dSCn3CN5aA5FlgZA3FE9nFUf1lyPXHBF1mlwa1BHSAMlFBSiNKkVsvM1pAtF
 n8Y13Ztnu+wUwzao6+DpiDvRvYdtaIsyyqVscud4WV8cMHcmi71gCB/3vM5FJnJOIa4nURaWV
 Yhxi+Wc1Nb2oPbYcqLL749ZOb9sPoxa4rwvh/8lHRcwGFYZaU5MtOWM5DhyWg3Gg7u86nInFn
 t824QLRnZBaZ4QnAvAyPCxp5f0G5jZi4Ay7EpTu5OeDsyqNY1nem9kdryy6kDGxl0lySB/W5w
 VtXkLgdrUY+3ZITgD3iCsQAZ98a0SjPJRCWSk5ZkQicU1uD8KFHKtZd7Zek21r8apWgHgu1im
 0huqmJL2tb/iOjzBG3YPBEYOvfLjswHOZyMoixsOT8ST5y69J0adIKxFKupB/COHlSeq5ojB4
 1lh0e733i6p0yWbvz9BZ2T+Do6Y1avmb03IxM2eTgp0FvG97FMhgawdKlZYfsORt2grtsk6il
 AJPyL6j3vXv/6SXS71itFyEHXxjjaaC3/xWB9AHO7MRHd+m0mNzm0IP0jl5/b7PwW8XD9GDLA
 Ft27Teo4qZXpfQKcZ7jSUQdt0cB5XCJtneraxgtiTXonLL5x/OGsrhVjSMCLqx5UxjjUNzMRW
 w4CWc/+MMrBw8P1rOCV+X5wjv+PKJ4m4Ww9KSNQ83RnybwfCEsSGT1KFYTkmYjcBAF7HY+ux3
 fDGm2z0MsZ4+F18fv7JCBoa7w6edQmM4/37ERIB8IhUXR6BJB9k4LZZUMOXXJZAkSGtfPWEga
 EVbDXYP02uYVzqRAWaL5oIBx3dG0iV3PSE2CiHXa3kW4ZINcN3QF1YZnVmq6WOGrdKOWaT5uH
 74Kwr7oD2vZ0Q4GVVoJPk2MRifvRWKd7brbYaqK3hEzyBgS8W8Ydss5QbinwPBFRS8Erf/Ufk
 IXrej6NLmS395exmP16V/8sKsHASauxKOGTQA9KsPVzHSBZFapePGTZFkaPcy+iQIZlAWepsq
 TiHuFXBLfsu3KLEHiJFJ0bEEN//vSGwgqpPw7wQ2vMYq0s9Du6ISSyuO1vbkRzYXWo5Q9qjBY
 5D1oGvD12NK+GkzV5DnekRNqi3CTijnCrpqG6UGO972aGiIF7amNigh21iEnsg+zF+gmq018p
 SPhht+1wOs1oXMUGwPVwHbXpSv5o/BMKmWSp2VcVgzGMpVTbm6whWqRsZteeyzoateTlmu6/q
 WZvL1KvFX8grQ4XhZ6En8CsxMgaKDb8GpgdCSwcGjlB/d2jWshvF4BAyRW61TiUZIjCh5KU87
 ErFTDd1ELfa6/xA3ev5QtGLWlmjmb6NqTXVtLw/11S9BbIfhxc0xjbPjvmyChQEjFbV4yL3Rw
 Hv4aHLrLitd2d0vAwGIQOKduEmOST1ofEaAIQtzVQWnk0OXla2jSjcsw9oILAP8X7P96vfihn
 P6hysMuc7kWuiKMQpPgasL7YmN3sTFplq7xZOMbU28dPJznRQusTozqExApUOHRFpNni54tNB
 dVVnQzV6iNoGZIepsUtsw9HOXMPmN/lzt4FvdFW3lvkn2CK4X4IbGjwoXsRWbUp2b39GW6gw2
 YKGeA7P2Zslcl2wm7H21T4NmTsM0527ZdXwo+C4ABnZirbDgcTpe89gu1JKy0cJ5RVWzGwSQt
 SQrpnIrf5rrHEgrZ6zASMLWRKvFP3XLN21LHfeub1C7Rk30VcYLbhiQ5KNCvIyJA+vP7kr9Ll
 614QJhFl8OhIub7c4Qnyzp7MV55sJg8C1NE7boNW9fYrl7wxtyKkrIbmK3KMkamu/TQduFIdS
 rBLug==

=E2=80=A6
> ---
> This was brought to my attention by a person under sanctions. This is a
> simplified version of their initial patch.
>=20
>  drivers/gpio/gpiolib.c | 5 +++++
=E2=80=A6

Would the tag =E2=80=9CReported-by=E2=80=9D become relevant here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc3#n539

Regards,
Markus

