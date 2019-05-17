Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5E8B214AC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2019 09:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbfEQHkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 May 2019 03:40:45 -0400
Received: from mail.lunchkarty.eu ([80.211.141.150]:54728 "EHLO lunchkarty.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728520AbfEQHkm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 May 2019 03:40:42 -0400
Received: by lunchkarty.eu (Postfix, from userid 1001)
        id AC104877E2; Fri, 17 May 2019 09:30:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lunchkarty.eu;
        s=mail; t=1558078303;
        bh=DRu0vjHfbY7ipkVfR5IVkS8rC2tRt9/vG06AzL2xOt4=;
        h=Date:From:To:Subject:From;
        b=dzAWPqOF6LTha6YLWSWrxf3hPlN4XEBn2j1P17TSXVREsKLvl3TJcPpiINUw93G1m
         Di1OaUQAy1YbJV0Bc0Fc42I5Fepy9eCZSkT80FXsIeptOhysDnHrJIBn4YT/NYa3Mb
         QFA1Rlf+aeCHBK+jgVj8h+eg1dyen+KTDjPw0W5M=
Received: by mail.lunchkarty.eu for <linux-gpio@vger.kernel.org>; Fri, 17 May 2019 07:30:35 GMT
Message-ID: <20190517084500-0.1.11.2ob8.0.m510vfipmz@lunchkarty.eu>
Date:   Fri, 17 May 2019 07:30:35 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@lunchkarty.eu>
To:     <linux-gpio@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=92=D0=B5=D0=BB=D0=B8=D0=BA=D0=B4=D0=B5=D0=BD=D1=81=D0=BA=D0=B8_=D0=B1=D0=BE=D0=BD=D1=83=D1=81=D0=B8?=
X-Mailer: mail.lunchkarty.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5!

=D0=9D=D1=83=D0=B6=D0=B4=D0=B0=D0=B5=D1=82=D0=B5 =D0=BB=D0=B8 =D1=81=D0=B5=
 =D0=BE=D1=82 =D0=BC=D0=BE=D1=82=D0=B8=D0=B2=D0=B0=D1=86=D0=B8=D0=BE=D0=BD=
=D0=B5=D0=BD =D0=BF=D0=B0=D0=BA=D0=B5=D1=82 =D0=B7=D0=B0 =D0=BF=D0=B5=D1=80=
=D1=81=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0, =D0=BA=D0=BE=D0=B9=D1=82=D0=BE =D0=B5=
 =D1=83=D0=B4=D0=BE=D0=B1=D0=B5=D0=BD =D0=B8 =D0=BF=D1=80=D0=B8=D0=B2=D0=BB=
=D0=B5=D0=BA=D0=B0=D1=82=D0=B5=D0=BB=D0=B5=D0=BD, =D0=BA=D0=B0=D0=BA=D1=82=
=D0=BE =D0=B7=D0=B0 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BE=D0=B4=D0=B0=D1=82=
=D0=B5=D0=BB=D1=8F, =D1=82=D0=B0=D0=BA=D0=B0 =D0=B8 =D0=B7=D0=B0 =D1=81=D0=
=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5?

=D0=92 =D1=82=D0=B0=D0=BA=D1=8A=D0=B2 =D1=81=D0=BB=D1=83=D1=87=D0=B0=D0=B9=
 =D0=92=D0=B8 =D0=BF=D1=80=D0=B5=D0=BF=D0=BE=D1=80=D1=8A=D1=87=D0=B2=D0=B0=
=D0=BC=D0=B5 =D0=B4=D0=B0 =D0=BE=D0=B1=D0=BC=D0=B8=D1=81=D0=BB=D0=B8=D1=82=
=D0=B5 =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5=D1=82=
=D0=BE =D0=BD=D0=B0 =D0=B2=D1=81=D0=B5 =D0=BF=D0=BE-=D0=BF=D0=BE=D0=BF=D1=
=83=D0=BB=D1=8F=D1=80=D0=BD=D0=B8=D1=82=D0=B5 =D0=B2=D0=B0=D1=83=D1=87=D0=
=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0 - =D1=80=D0=B0=
=D0=B1=D0=BE=D1=82=D0=BE=D0=B4=D0=B0=D1=82=D0=B5=D0=BB=D1=8F=D1=82 =D0=BE=
=D1=81=D0=B8=D0=B3=D1=83=D1=80=D1=8F=D0=B2=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=
=D0=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D0=BE=D0=BF=D1=80=D0=B5=D0=B4=D0=B5=D0=BB=
=D0=B5=D0=BD=D0=B0 =D1=81=D1=83=D0=BC=D0=B0, =D0=B0 =D1=81=D0=BB=D1=83=D0=
=B6=D0=B8=D1=82=D0=B5=D0=BB=D1=8F=D1=82 =D0=BC=D0=BE=D0=B6=D0=B5 =D0=B4=D0=
=B0 =D1=8F =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0 =D0=B2 =D1=80=
=D0=B0=D0=B7=D0=BB=D0=B8=D1=87=D0=BD=D0=B8 =D0=B2=D0=B5=D1=80=D0=B8=D0=B3=
=D0=B8 =D1=85=D1=80=D0=B0=D0=BD=D0=B8=D1=82=D0=B5=D0=BB=D0=BD=D0=B8 =D0=BC=
=D0=B0=D0=B3=D0=B0=D0=B7=D0=B8=D0=BD=D0=B8 =D0=B8=D0=BB=D0=B8 =D0=B7=D0=B0=
=D0=B2=D0=B5=D0=B4=D0=B5=D0=BD=D0=B8=D1=8F =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=
=D0=BD=D0=B5=D0=BD=D0=B5 =D1=81=D0=BF=D0=BE=D1=80=D0=B5=D0=B4 =D1=81=D0=B2=
=D0=BE=D0=B8=D1=82=D0=B5 =D0=BF=D1=80=D0=B5=D0=B4=D0=BF=D0=BE=D1=87=D0=B8=
=D1=82=D0=B0=D0=BD=D0=B8=D1=8F.

=D0=A9=D0=B5 =D1=81=D0=B5 =D1=80=D0=B0=D0=B4=D0=B2=D0=B0=D0=BC =D0=B4=D0=B0=
 =D0=92=D0=B8 =D0=BF=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B0=D0=B2=D1=8F =D0=B2=
=D1=8A=D0=B7=D0=BC=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =
=D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8=D1=82=D0=B5  =E2=80=
=93 =D0=BC=D0=BE=D0=B3=D0=B0 =D0=BB=D0=B8 =D0=B4=D0=B0 =D0=92=D0=B8 =D1=81=
=D0=B5 =D0=BE=D0=B1=D0=B0=D0=B4=D1=8F, =D0=B7=D0=B0 =D0=B4=D0=B0 =D0=BE=D0=
=B1=D1=81=D1=8A=D0=B4=D0=B8=D0=BC =D0=B2 =D0=B4=D0=B5=D1=82=D0=B0=D0=B9=D0=
=BB=D0=B8?


=D0=A0=D0=B0=D0=B4=D0=BE=D1=81=D0=BB=D0=B0=D0=B2 =D0=94=D0=BE=D0=B1=D1=80=
=D0=B5=D0=B2
Head of HR Benefit Team
www.lunchkarty.eu 
