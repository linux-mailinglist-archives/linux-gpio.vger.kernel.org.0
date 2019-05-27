Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A10DB2B129
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 11:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfE0JOD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 05:14:03 -0400
Received: from mail.lunch4employee.eu ([80.211.219.151]:57456 "EHLO
        mail.lunch4employee.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfE0JOD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 05:14:03 -0400
X-Greylist: delayed 451 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 05:14:02 EDT
Received: by mail.lunch4employee.eu (Postfix, from userid 1001)
        id 9480787F36; Mon, 27 May 2019 11:06:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lunch4employee.eu;
        s=mail; t=1558947990;
        bh=ONuCP8WSrotnQIIUXuF9Z25xGEoxfqhSKmedy3wfW2M=;
        h=Date:From:To:Subject:From;
        b=NheCCVZLH56xu8/C6YfH7Ffrxv5t+t0eOUvrovI9S03JuhPvuL5x5+EC5mA6OtAd+
         zl+uF2Q9nNJZWuXPAhTRMN+VrVYcaG4rIfZPOR/XyG3IGaEZa/XJbLuW0Di3ofheuV
         hXV3wHhwv5srXlAW7hEE0joppewQEvI2SehPJXGY=
Received: by mail.lunch4employee.eu for <linux-gpio@vger.kernel.org>; Mon, 27 May 2019 09:06:27 GMT
Message-ID: <20190527084500-0.1.m.u1w.0.b05inie2k9@lunch4employee.eu>
Date:   Mon, 27 May 2019 09:06:27 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@lunch4employee.eu>
To:     <linux-gpio@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=9F=D1=80=D0=B8=D0=B4=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B8_=D0=B7=D0=B0_=D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0?=
X-Mailer: mail.lunch4employee.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5,

=D0=97=D0=B0=D0=BF=D0=BE=D0=B7=D0=BD=D0=B0=D1=82=D0=B8 =D0=BB=D0=B8 =D1=81=
=D1=82=D0=B5 =D1=81 =D0=BD=D0=B0=D0=B9-=D0=BD=D0=BE=D0=B2=D0=B0=D1=82=D0=B0=
 =D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B0 =D0=BF=D1=80=D0=B8=D0=B4=
=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B0 =E2=80=93 =D0=B2=D0=B0=D1=83=D1=87=D0=
=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0? =D0=90 =D0=BE=
=D0=B1=D0=BC=D0=B8=D1=81=D0=BB=D1=8F=D0=BB=D0=B8 =D0=BB=D0=B8 =D1=81=D1=82=
=D0=B5 =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5=D1=82=
=D0=BE =D0=BD=D0=B0 =D1=82=D0=B0=D0=BA=D0=B8=D0=B2=D0=B0 =D0=B2=D0=B0=D1=83=
=D1=87=D0=B5=D1=80=D0=B8, =D1=81 =D0=BF=D0=BE=D0=BC=D0=BE=D1=89=D1=82=D0=B0=
 =D0=BD=D0=B0 =D0=BA=D0=BE=D0=B8=D1=82=D0=BE =D0=92=D0=B0=D1=88=D0=B8=D1=8F=
=D1=82 =D0=BF=D0=B5=D1=80=D1=81=D0=BE=D0=BD=D0=B0=D0=BB =D0=BC=D0=BE=D0=B6=
=D0=B5 =D0=B4=D0=B0 =D0=BF=D0=B0=D0=B7=D0=B0=D1=80=D1=83=D0=B2=D0=B0 =D0=B2=
 =D1=80=D0=B0=D0=B7=D0=BB=D0=B8=D1=87=D0=BD=D0=B8 =D0=B2=D0=B5=D1=80=D0=B8=
=D0=B3=D0=B8 =D1=85=D1=80=D0=B0=D0=BD=D0=B8=D1=82=D0=B5=D0=BB=D0=BD=D0=B8=
 =D0=BC=D0=B0=D0=B3=D0=B0=D0=B7=D0=B8=D0=BD=D0=B8 =D0=B8 =D0=B7=D0=B0=D0=B2=
=D0=B5=D0=B4=D0=B5=D0=BD=D0=B8=D1=8F?

=D0=91=D0=B8=D1=85 =D0=BC=D0=BE=D0=B3=D1=8A=D0=BB =D0=B4=D0=B0 =D0=92=D0=B8=
 =D1=81=D0=B5 =D0=BE=D0=B1=D0=B0=D0=B4=D1=8F =D0=BF=D0=BE =D1=82=D0=B5=D0=
=BB=D0=B5=D1=84=D0=BE=D0=BD=D0=B0 =D0=B8 =D0=B4=D0=B0 =D0=92=D0=B8 =D0=BF=
=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B0=D0=B2=D1=8F =D0=B2=D1=8A=D0=B7=D0=BC=
=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =D0=BD=D0=B0 =D1=82=
=D0=B5=D0=B7=D0=B8 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =E2=80=93 =D0=
=BC=D0=BE=D0=BB=D1=8F =D0=BF=D0=BE=D1=81=D0=BE=D1=87=D0=B5=D1=82=D0=B5 =D0=
=BA=D0=BE=D0=B3=D0=B0 =D1=89=D0=B5 =D0=92=D0=B8 =D0=B1=D1=8A=D0=B4=D0=B5 =
=D1=83=D0=B4=D0=BE=D0=B1=D0=BD=D0=BE =D0=B4=D0=B0 =D1=80=D0=B0=D0=B7=D0=B3=
=D0=BE=D0=B2=D0=B0=D1=80=D1=8F=D0=BC=D0=B5.

=D0=9F=D1=80=D0=B8=D1=8F=D1=82=D0=B5=D0=BD =D0=B4=D0=B5=D0=BD!


=D0=A0=D0=B0=D0=B4=D0=BE=D1=81=D0=BB=D0=B0=D0=B2 =D0=94=D0=BE=D0=B1=D1=80=
=D0=B5=D0=B2
Head of HR Benefit Team
www.lunch4employee.eu
